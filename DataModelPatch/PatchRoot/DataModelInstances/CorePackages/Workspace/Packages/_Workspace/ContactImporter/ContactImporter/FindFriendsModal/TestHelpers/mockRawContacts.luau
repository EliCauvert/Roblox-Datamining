local LongList = {}

for i = 1, 25 do
	table.insert(LongList, {
		phonenumber = { (tostring(i)) },
		lastname = "Person" .. tostring(i),
		firstname = "Test" .. tostring(i)
	})
end
return {
	shortList = {
		{
			lastname = "a",
			firstname = "alex",
			phonenumber = { "44 2350328333" }
		},
		{
			lastname = "b",
			firstname = "bob",
			phonenumber = { "980889091" }
		},
		{
			lastname = "c",
			firstname = "cathy",
			phonenumber = { "980889090" }
		},
		{
			lastname = "z",
			firstname = "zack",
			phonenumber = { "980889090" }
		}
	},
	longList = LongList
}