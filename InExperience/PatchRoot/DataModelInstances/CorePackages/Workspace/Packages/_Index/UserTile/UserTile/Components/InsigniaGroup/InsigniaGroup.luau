local UserTile = script:FindFirstAncestor("UserTile")
local Parent = UserTile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local VerifiedBadgeModule = require(Parent.VerifiedBadges.VerifiedBadge)
local InsigniaTypeModule = require(UserTile.Enums.InsigniaType)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local list = {
	InsigniaTypeModule.Trusted,
	InsigniaTypeModule.Verified,
	InsigniaTypeModule.RobloxPlus,
	InsigniaTypeModule.RobloxAdmin
}
local config = {
	[InsigniaTypeModule.Trusted] = IconName.CircleStar,
	[InsigniaTypeModule.RobloxPlus] = IconName.RobloxPlus,
	[InsigniaTypeModule.RobloxAdmin] = IconName.Tilt
}
local config1 = {
	[InsigniaTypeModule.Trusted] = "trusted",
	[InsigniaTypeModule.Verified] = "verified",
	[InsigniaTypeModule.RobloxPlus] = "roblox-plus",
	[InsigniaTypeModule.RobloxAdmin] = "roblox-admin"
}

return function(p1)
	-- upvalues: UseTokensFunction (copy), list (copy), config1 (copy), InsigniaTypeModule (copy), ReactModule (copy), VerifiedBadgeModule (copy), Icon (copy), config (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local TestId = p1.testId or "--insignia-group"
	local t = {}
	
	for _, item in p1.items do
		t[item] = true
	end
	local Elements = {}
	
	for LayoutOrder, value in list do
		if t[value] then
			local Text: string = `{TestId}--{config1[value]}`
			Elements[value] = if value == InsigniaTypeModule.Verified then ReactModule.createElement(VerifiedBadgeModule, { size = p1.size, LayoutOrder = LayoutOrder, testId = Text }) else ReactModule.createElement(Icon, {
				name = config[value],
				size = p1.size,
				style = UseTokensResult.Color.Content.Emphasis,
				LayoutOrder = LayoutOrder,
				testId = Text
			})
		end
	end
	return if next(Elements) == nil then nil else ReactModule.createElement(View, {
		tag = "row align-y-center auto-xy",
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onActivated,
		selection = if p1.onActivated then { Selectable = true } else nil,
		testId = TestId
	}, Elements)
end