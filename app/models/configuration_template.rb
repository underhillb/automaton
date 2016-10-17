class ConfigurationTemplate < ApplicationRecord
  has_many :configuration_details, :dependent => :destroy
  has_many :configuration_files, :dependent => :destroy
  accepts_nested_attributes_for :configuration_details, allow_destroy: true
  after_save :create_yaml
  attr_accessor :version
  def version
    self.configuration_files.order('version DESC').limit(1).first.version
  end
  def create_yaml
    puts "checking if Configure has changed"
    output=[]
    self.configuration_details.each do |data|
      output <<"#{data.configuration_detail_order}:#{data.configuration_detail_type.name}:#{data.configuration_detail_data}\n"
    end
    current_yaml=output.sort!.join
    version=0
    latest=self.configuration_files.order('version DESC').limit(1).first
    if latest.blank?
      version=1
      puts "******************************not file existing , need to create"


    else
      if current_yaml  != latest.file_content
        puts "current:#{current_yaml}"
        puts "existin:#{latest.file_content}"
        version=latest.version+1
      end
    end
    if version >0
      configuration_file=ConfigurationFile.new
      configuration_file.file_content=current_yaml
      configuration_file.version=version
      configuration_file.configuration_template_id=self.id
      configuration_file.save
      puts "******************************Creating new file version #{configuration_file}"
    else
      puts "******************************content did not  change"

    end

  end
end
