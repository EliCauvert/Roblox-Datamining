local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local PromiseModule = require(InExperienceShop.Parent.Promise)
local ConstantsModule = require(InExperienceShop.Constants)
local _ = require(InExperienceShop.Types)
local list = {
	{
		id = "3520436958",
		name = "product1",
		thumbnail = "rbxassetid://139209047523431",
		price = 1,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "test",
		updated = "2026-02-09T22:14:44.486Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	},
	{
		id = "3533934241",
		name = "product2",
		thumbnail = "rbxassetid://87392709922646",
		price = 1,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "This is the description",
		updated = "2026-02-09T22:25:41.802Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	},
	{
		id = "3539559418",
		name = "Dev2's` <3 Test",
		thumbnail = "rbxassetid://87631972256697",
		price = 1,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "Test Description...",
		updated = "2026-02-18T00:17:01.48Z",
		creator = { name = "MockCreator2", hasVerifiedBadge = false }
	},
	{
		id = "3579160491",
		name = "Very Long Product1",
		thumbnail = "rbxassetid://100887043069019",
		price = 2,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "Test",
		updated = "2026-04-21T04:37:16.988Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	},
	{
		id = "3579160539",
		name = "Prod3",
		thumbnail = "rbxassetid://81961804970825",
		price = 1,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "Test Description...",
		updated = "2026-04-21T04:29:53.708Z",
		creator = { name = "MockCreator3", hasVerifiedBadge = false }
	},
	{
		id = "3579160572",
		name = "Prod5",
		thumbnail = "rbxassetid://114076823404152",
		price = 2,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "",
		updated = "2026-04-21T04:36:12.611Z",
		creator = { name = "MockCreator44", hasVerifiedBadge = false }
	},
	{
		id = "3579166829",
		name = "Prod7",
		thumbnail = "rbxassetid://126948782997414",
		price = 2,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "Really long description that spans more than one line but could span multiple lines.",
		updated = "2026-04-21T04:36:37.726Z",
		creator = { name = "MockCreator5", hasVerifiedBadge = false }
	},
	{
		id = "3579166863",
		name = "Prod8",
		thumbnail = "rbxassetid://133455066661752",
		price = 2,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "Test &nbsp; Description with special characters <>#$%^&*()_+-=[]{}|\\:;\"'<>,.?/~`!",
		updated = "2026-04-21T04:37:03.186Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	},
	{
		id = "3579166918",
		name = "Prod9",
		thumbnail = "rbxassetid://104454970093144",
		price = 5,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "Test Description...",
		updated = "2026-04-21T04:36:50.442Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	},
	{
		id = "3579166948",
		name = "Prod11",
		thumbnail = "rbxassetid://79364533981550",
		price = 100,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "Test Description...",
		updated = "2026-04-25T00:01:47.859Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	}
}
local list1 = {
	{
		id = "1804642568",
		name = "pass5",
		thumbnail = "rbxassetid://87272847166128",
		price = 2,
		isOwned = false,
		itemType = "GamePass",
		universeId = "9238531179",
		description = "Test Description...",
		updated = "2026-04-21T04:39:24.953Z",
		creator = { name = "KickCodePrep", hasVerifiedBadge = false }
	},
	{
		id = "1804340575",
		name = "pass5",
		thumbnail = "rbxassetid://109612833123000",
		price = 4,
		isOwned = false,
		itemType = "GamePass",
		universeId = "9238531179",
		description = "Test Description...",
		updated = "2026-04-21T04:39:59.813Z",
		creator = { name = "KickCodePrep", hasVerifiedBadge = false }
	},
	{
		id = "1714448958",
		name = "Thanks's` <3",
		thumbnail = "rbxassetid://77927364622086",
		price = 1,
		isOwned = false,
		itemType = "GamePass",
		universeId = "9238531179",
		description = "Test Description...",
		updated = "2026-02-18T00:09:23.903Z",
		creator = { name = "KickCodePrep", hasVerifiedBadge = false }
	},
	{
		id = "1716550603",
		name = "Thanks’s <3 :heart::victory_hand:t2:",
		thumbnail = "rbxassetid://125786017250029",
		price = 1,
		isOwned = false,
		itemType = "GamePass",
		universeId = "9238531179",
		description = "Test",
		updated = "2026-02-18T00:05:06.047Z",
		creator = { name = "KickCodePrep", hasVerifiedBadge = false }
	},
	{
		id = "1683715929",
		name = "pass1",
		thumbnail = "rbxassetid://104071175854790",
		price = 2,
		isOwned = false,
		itemType = "GamePass",
		universeId = "9238531179",
		description = "test",
		updated = "2026-04-21T04:38:16.87Z",
		creator = { name = "KickCodePrep", hasVerifiedBadge = false }
	}
}

local function pickRandomItems()
	-- upvalues: list (copy), list1 (copy)
	local Buffer = table.create(#list + #list1)
	table.move(list, 1, #list, 1, Buffer)
	table.move(list1, 1, #list1, #list + 1, Buffer)
	
	for i = #Buffer, 2, -1 do
		local RandomValue = math.random(1, i)
		local BufferEntry = Buffer[i]
		Buffer[i] = Buffer[RandomValue]
		Buffer[RandomValue] = BufferEntry
	end
	local Smallest = math.min(math.random(8, 10), #Buffer)
	local Buffer1 = table.create(Smallest)
	
	for i1 = 1, Smallest do
		Buffer1[i1] = Buffer[i1]
	end
	return Buffer1
end

local list2 = {
	{ name = "Home" },
	{ name = "Top picks", items = pickRandomItems() },
	{
		name = "Robux",
		robuxPackages = {
			{
				id = "229",
				productId = 229,
				mobileProductId = "com.roblox.client.robux40",
				robuxAmount = 40,
				currencyAmountStr = "$0.49",
				robuxImage = ConstantsModule.ROBUX_PACKAGE_IMAGE
			},
			{
				id = "613",
				productId = 613,
				mobileProductId = "com.roblox.robloxmobile.premium80robux",
				robuxAmount = 80,
				currencyAmountStr = "$0.99",
				robuxImage = ConstantsModule.ROBUX_PACKAGE_IMAGE
			},
			{
				id = "470",
				productId = 470,
				mobileProductId = "com.roblox.robloxmobile.premium400robux",
				robuxAmount = 400,
				currencyAmountStr = "$4.99",
				robuxImage = ConstantsModule.ROBUX_PACKAGE_IMAGE
			},
			{
				id = "471",
				productId = 471,
				mobileProductId = "com.roblox.robloxmobile.premium800robux",
				robuxAmount = 800,
				currencyAmountStr = "$9.99",
				robuxImage = ConstantsModule.ROBUX_PACKAGE_IMAGE
			},
			{
				id = "472",
				productId = 472,
				mobileProductId = "com.roblox.robloxmobile.premium1700robux",
				robuxAmount = 1700,
				currencyAmountStr = "$19.99",
				robuxImage = ConstantsModule.ROBUX_PACKAGE_IMAGE
			},
			{
				id = "473",
				productId = 473,
				mobileProductId = "com.roblox.robloxmobile.premium4500robux",
				robuxAmount = 4500,
				currencyAmountStr = "$49.99",
				robuxImage = ConstantsModule.ROBUX_PACKAGE_IMAGE
			},
			{
				id = "474",
				productId = 474,
				mobileProductId = "com.roblox.robloxmobile.premium10000robux",
				robuxAmount = 10000,
				currencyAmountStr = "$99.99",
				robuxImage = ConstantsModule.ROBUX_PACKAGE_IMAGE
			},
			{
				id = "21",
				productId = 21,
				mobileProductId = "com.roblox.client.robux22500",
				robuxAmount = 22500,
				currencyAmountStr = "$199.99",
				robuxImage = ConstantsModule.ROBUX_PACKAGE_IMAGE
			}
		}
	},
	{ name = "Coins", items = pickRandomItems() },
	{ name = "Boosts", items = pickRandomItems() },
	{ name = "Upgrades", items = pickRandomItems() },
	{ name = "Cosmetics", items = pickRandomItems() },
	{ name = "Gear", items = pickRandomItems() }
}

local function buildShopData()
	-- upvalues: list2 (copy)
	local Buffer = table.create(#list2)
	local Sections = {}
	
	for i, value in ipairs(list2) do
		local Text = tostring(i)
		Buffer[i] = { id = Text, name = value.name }
		
		if value.name ~= "Home" then
			table.insert(Sections, {
				id = Text,
				name = value.name,
				items = value.items or {},
				robuxPackages = value.robuxPackages
			})
		end
	end
	return { categories = Buffer, sections = Sections }
end

return {
	MOCK_PRODUCT_ITEMS = list,
	MOCK_GAMEPASS_ITEMS = list1,
	buildShopItems = function()
		-- upvalues: list2 (copy)
		local Categories = {}
		
		for _, value in ipairs(list2) do
			if value.name ~= "Home" and value.name ~= "Robux" then
				local Items = value.items or {}
				local Buffer = table.create(#Items)
				
				for Id, item in ipairs(Items) do
					Buffer[Id] = { id = Id, type = item.itemType }
				end
				table.insert(Categories, { id = #Categories + 1, name = value.name, items = Buffer })
			end
		end
		return { categories = Categories }
	end,
	getShopData = function(p1)
		-- upvalues: PromiseModule (copy), buildShopData (copy)
		return PromiseModule.delay(if p1 == nil then 0.5 else p1):andThen(function()
			-- upvalues: buildShopData (upval)
			return (buildShopData())
		end)
	end
}