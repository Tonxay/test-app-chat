// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.
// Code generated by gorm.io/gen. DO NOT EDIT.

package models

const TableNameCustomer = "customers"

// Customer mapped from table <customers>
type Customer struct {
	FacebookID  string `gorm:"column:facebook_id;primaryKey" json:"facebook_id"`
	LastName    string `gorm:"column:last_name" json:"last_name"`
	Image       string `gorm:"column:image" json:"image"`
	PhoneNumber int32  `gorm:"column:phone_number" json:"phone_number"`
	FirstName   string `gorm:"column:first_name" json:"first_name"`
	ID          string `gorm:"column:id;not null;default:gen_random_uuid()" json:"id"`
}

// TableName Customer's table name
func (*Customer) TableName() string {
	return TableNameCustomer
}
