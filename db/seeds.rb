ConfigurationDetailType.create!([
  {name: "access", description: "Access to the system"},
  {name: "sudo", description: "Escalated privileges "},
  {name: "yum", description: "Linux  Package"},
  {name: "directory", description: "directory with owner/group and permission"},
  {name: "file", description: "file with owner/group and permission"},
  {name: "sysctl", description: "system settings"}
])
ObjectType.create!([
  {name: "Compute", description: "VM Instance"}
])
