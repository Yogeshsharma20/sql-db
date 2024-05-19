
resource "azurerm_mssql_server" "sqlserver" {
  for_each                     = var.sql_map
  name                         = each.value.sql_server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password

}


resource "azurerm_mssql_database" "sqldb" {
  for_each       = var.sql_map
  name           = each.value.sql_db_name
  server_id      = azurerm_mssql_server.sqlserver[each.key].id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true
  enclave_type   = "VBS"
}
  