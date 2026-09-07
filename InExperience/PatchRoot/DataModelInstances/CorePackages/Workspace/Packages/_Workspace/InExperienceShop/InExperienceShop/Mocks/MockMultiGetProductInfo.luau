local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local promiseModule = require(inExperienceShop.Parent.Promise)
local _ = require(inExperienceShop.Types)
local _ = require(inExperienceShop.Api.multiGetProductInfo)
local list = {
	{
		id = "3520436958",
		name = "product1",
		thumbnail = "rbxassetid://139209047523431",
		price = 1,
		userBasePriceInRobux = 2,
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
		displayName = "Product Two",
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
		displayName = "Dev2's Love Test",
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
	},
	{
		id = "39470720",
		name = "Tire replacement (HARD)",
		displayName = "Hard Tire Replacement",
		thumbnail = "rbxassetid://122887820466566",
		price = 45,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "",
		updated = "2025-12-15T22:53:13.711Z",
		creator = { name = "testCreator2", hasVerifiedBadge = false }
	},
	{
		id = "39470718",
		name = "Tire replacement (SOFT)",
		thumbnail = "rbxassetid://130586726558884",
		price = 45,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "Replace your car tires to SOFT",
		updated = "2025-12-15T22:44:39.501Z",
		creator = { name = "testCreator3", hasVerifiedBadge = false }
	},
	{
		id = "39470724",
		name = "Steering boost",
		thumbnail = "rbxassetid://72184904612174",
		price = 135,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "More responsive steering",
		updated = "2025-12-15T23:01:33.255Z",
		creator = { name = "testCreator4", hasVerifiedBadge = false }
	},
	{
		id = "39470723",
		name = "Breaking boost",
		thumbnail = "rbxassetid://91006335819368",
		price = 90,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "Faster breaking",
		updated = "2025-12-15T23:00:34.873Z",
		creator = { name = "CreatorBoost", hasVerifiedBadge = false }
	},
	{
		id = "40896176",
		name = "Emoji Happy",
		displayName = "\240\159\152\138 Happy Emoji",
		thumbnail = "rbxassetid://81645138491017",
		price = 10,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "Dev product with happy emoji",
		updated = "2026-05-11T18:35:49.447Z",
		creator = { name = "testCreator1", hasVerifiedBadge = false }
	},
	{
		id = "39470725",
		name = "Nitro",
		thumbnail = "rbxassetid://121119743518857",
		price = 68,
		isOwned = false,
		itemType = "Product",
		universeId = "9238531179",
		description = "Single-use very fast acceleration",
		updated = "2025-12-15T23:02:44.396Z",
		creator = { name = "randomCreator", hasVerifiedBadge = false }
	}
}
local list_1 = {
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
		displayName = "Thanks \226\157\164\239\184\143",
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
		name = "Thanks\226\128\153s <3 :heart::victory_hand:t2:",
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
	},
	{
		id = "11836039",
		name = "bear animal pass",
		thumbnail = "rbxassetid://98258991849897",
		price = 7,
		isOwned = false,
		itemType = "GamePass",
		universeId = "9238531179",
		description = "Bear animal pass description",
		updated = "2026-05-11T20:11:28.05Z",
		creator = { name = "LeonardoCuteFingers", hasVerifiedBadge = false }
	},
	{
		id = "11839039",
		name = "Pass Coke",
		thumbnail = "rbxassetid://94688592507289",
		price = 8,
		isOwned = false,
		itemType = "GamePass",
		universeId = "9238531179",
		description = "#########",
		updated = "2026-05-11T20:10:42.79Z",
		creator = { name = "LeonardoCuteFingers", hasVerifiedBadge = false }
	},
	{
		id = "11809057",
		name = "Smiley pass",
		thumbnail = "rbxassetid://126864504460481",
		price = 2,
		isOwned = false,
		itemType = "GamePass",
		universeId = "9238531179",
		description = "root pass for other passes",
		updated = "2026-05-11T19:33:39.1Z",
		creator = { name = "LeonardoCuteFingers", hasVerifiedBadge = false }
	},
	{
		id = "11839038",
		name = "Blue pass neutral",
		thumbnail = "rbxassetid://78120758531563",
		price = 5,
		isOwned = false,
		itemType = "GamePass",
		universeId = "9238531179",
		description = "Get this pass with blue power",
		updated = "2026-05-11T19:40:01.477Z",
		creator = { name = "LeonardoCuteFingers", hasVerifiedBadge = false }
	},
	{
		id = "4242",
		name = "Bonus Game Pass",
		thumbnail = "rbxassetid://42424242424242",
		price = 99,
		isOwned = false,
		itemType = "GamePass",
		universeId = "9238531179",
		description = "Bonus item for Robux packages",
		updated = "2026-05-20T12:00:00.000Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	}
}
local var1 = (function()
	-- upvalues: list (ref), list_1 (ref)
	local t = {}
	
	for i, v in ipairs(list) do
		t["Product:" .. v.id] = v
	end
	for i, v_1 in ipairs(list_1) do
		t["GamePass:" .. v_1.id] = v_1
	end
	return t
end)()

local function _(value)
	return if value then tonumber(string.match(value, "rbxassetid://(%d+)")) or 0 else 0
end

local function shopItemToProductInfo(p1)
	local id = tonumber(p1.id) or 0
	local creator = p1.creator or { name = "", hasVerifiedBadge = false }
	local t = {
		IsForSale = true,
		Name = p1.name,
		DisplayName = p1.displayName,
		Description = p1.description or "",
		PriceInRobux = p1.price or 0,
		UserBasePriceInRobux = p1.userBasePriceInRobux,
		ProductId = id,
		AssetId = id,
		Updated = p1.updated
	}
	local thumbnail = p1.thumbnail
	t.IconImageAssetId = if not thumbnail then 0 else tonumber(string.match(thumbnail, "rbxassetid://(%d+)")) or 0
	t.Creator = {
		Name = creator.name,
		HasVerifiedBadge = creator.hasVerifiedBadge
	}
	
	return t
end

local function resolveRequest(p1)
	-- upvalues: var1 (ref), shopItemToProductInfo (ref)
	local var2 = var1[p1.infoType.Name .. ":" .. tostring(p1.id)]
	
	return if var2 == nil then {
		ok = false,
		request = p1,
		err = string.format("Mock product info not found for %s id %s", p1.infoType.Name, tostring(p1.id))
	} else {
		ok = true,
		request = p1,
		value = shopItemToProductInfo(var2)
	}
end

local _ = function(p1)
	return if p1 == nil then math.random() * 0.5 elseif p1 == 0 then 0 else math.random() * p1
end

return {
	MOCK_PRODUCT_ITEMS_FOR_TESTING = list,
	MOCK_GAMEPASS_ITEMS_FOR_TESTING = list_1,
	multiGetProductInfo = function(p1, p2)
		-- upvalues: promiseModule (ref), resolveRequest (ref)
		return promiseModule.delay(if p2 ~= nil then 0.5 else p2):andThen(function()
			-- upvalues: p1 (ref), resolveRequest (copy)
			local list = table.create(#p1)
			
			for i, v in ipairs(p1) do
				list[i] = resolveRequest(v)
			end
			return list
		end)
	end,
	streamMultiGetProductInfo = function(p3, p4, p5)
		-- upvalues: promiseModule (ref), resolveRequest (ref)
		local p5Count = #p3
		
		if p5Count == 0 then
			return promiseModule.resolve({})
		end
		local list = table.create(p5Count)
		local var2 = 0
		
		return promiseModule.new(function(p6)
			-- upvalues: p3 (ref), promiseModule (copy), p5 (ref), resolveRequest (copy), list (ref), p4 (ref), var2 (write), p5Count (ref)
			for i, v in ipairs(p3) do
				promiseModule.delay(if p5 ~= nil then math.random() * 0.5 elseif p5 == 0 then 0 else math.random() * p5):andThen(function()
					-- upvalues: resolveRequest (copy), v (ref), list (copy), i (ref), p4 (copy), var2 (copy), p5Count (copy), p6 (ref)
					local var3 = resolveRequest(v)
					list[i] = var3
					p4.onResult(var3)
					var2 += 1
					
					if var2 == p5Count then
						p6(list)
					end
				end)
			end
		end)
	end
}