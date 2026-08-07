local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local reactModule = require(corePackagesService.Packages.React)
local tModule = require(corePackagesService.Packages.t)
local verifiedBadgesModule = require(corePackagesService.Workspace.Packages.VerifiedBadges)
local userLibModule = require(corePackagesService.Workspace.Packages.UserLib)
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent.Parent
local withLayoutValues = require(parent.Components.Connection.LayoutValues).WithLayoutValues
local usePlayerCombinedNameModule = require(parent.Hooks.usePlayerCombinedName)
local createShallowEqualAndTablesModule = require(parent.createShallowEqualAndTables)
local fFlagPlayerListReduceRerendersModule = require(parent.Flags.FFlagPlayerListReduceRerenders)
local useVerifiedBadge = require(corePackagesService.Workspace.Packages.UserProfiles).Hooks.useVerifiedBadge
local fFlagEnableVerifiedBadgeStore = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore
local playerNameTag = reactModule.PureComponent:extend("PlayerNameTag")
playerNameTag.validateProps = tModule.strictInterface({
	player = require(robloxGui.Modules.Interfaces.playerInterface),
	isTitleEntry = tModule.boolean,
	isHovered = tModule.boolean,
	layoutOrder = tModule.integer,
	name = tModule.union(tModule.string, tModule.table),
	hasVerifiedBadge = tModule.optional(tModule.boolean),
	textStyle = tModule.strictInterface({
		Color = tModule.Color3,
		Transparency = tModule.number,
		StrokeColor = tModule.optional(tModule.Color3),
		StrokeTransparency = tModule.optional(tModule.number)
	}),
	textFont = tModule.strictInterface({
		Size = tModule.number,
		MinSize = tModule.number,
		Font = tModule.enum(Enum.Font)
	})
})

function playerNameTag.render(p0) --[[ line: 64 ]]
	-- upvalues: withLayoutValues (ref), fFlagEnableVerifiedBadgeStore (ref), userLibModule (ref), reactModule (ref), verifiedBadgesModule (ref)
	return withLayoutValues(function(p1) --[[ line: 65 ]]
		-- upvalues: p0 (ref), fFlagEnableVerifiedBadgeStore (copy), userLibModule (copy), reactModule (copy), verifiedBadgesModule (copy)
		local var12 = if p0.props.isHovered then p1.IconSelectedColor else p1.IconUnSelectedColor
		local font = p0.props.textFont.Font
		local size = p0.props.textFont.Size
		local t = {}
		local platformName = p0.props.player.PlatformName
		local var14 = if fFlagEnableVerifiedBadgeStore then p0.props.hasVerifiedBadge else userLibModule.Utils.isPlayerVerified(p0.props.player)
		
		if p1.IsTenFoot and platformName ~= "" then
			t.VerticalLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 10)
			})
			t.PlayerPlatformName = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0.35, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = Enum.Font.SourceSans,
				TextSize = size,
				TextColor3 = p0.props.textStyle.Color,
				TextTransparency = p0.props.textStyle.Transparency,
				TextStrokeColor3 = p0.props.textStyle.StrokeColor,
				TextStrokeTransparency = p0.props.textStyle.StrokeTransparency,
				Text = platformName
			})
			t.RobloxNameFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0.45, 0)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 6)
				}),
				RobloxIcon = reactModule.createElement("ImageButton", {
					BackgroundTransparency = 1,
					Selectable = false,
					LayoutOrder = 1,
					Size = UDim2.new(0, 24, 0, 24),
					Image = p1.RobloxIconImage,
					ImageColor3 = var12
				}),
				PlayerNameContainer = reactModule.createElement(verifiedBadgesModule.EmojiWrapper, {
					layoutOrder = 2,
					mockIsEnrolled = true,
					emoji = if var14 then verifiedBadgesModule.emoji.verified else "",
					size = UDim2.new(1, -30, 0, 0),
					automaticSize = Enum.AutomaticSize.Y,
					verticalAlignment = Enum.VerticalAlignment.Center
				}, {
					PlayerName = reactModule.createElement("TextLabel", {
						ClipsDescendants = false,
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.X,
						Size = UDim2.fromScale(0, 1),
						Font = font,
						Text = p0.props.name,
						TextSize = size,
						TextColor3 = p0.props.textStyle.Color,
						TextTransparency = p0.props.textStyle.Transparency,
						TextStrokeColor3 = p0.props.textStyle.StrokeColor,
						TextStrokeTransparency = p0.props.textStyle.StrokeTransparency,
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				})
			})
		else
			t.PlayerNameContainer = reactModule.createElement(verifiedBadgesModule.EmojiWrapper, {
				mockIsEnrolled = true,
				emoji = if var14 then verifiedBadgesModule.emoji.verified else "",
				anchorPoint = Vector2.new(0, 0.5),
				position = UDim2.fromScale(0, 0.5),
				verticalAlignment = Enum.VerticalAlignment.Center,
				automaticSize = Enum.AutomaticSize.X,
				size = UDim2.new(0, 0, 0, size)
			}, {
				PlayerName = reactModule.createElement("TextLabel", {
					TextScaled = false,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.fromScale(0, 1),
					Font = font,
					Text = p0.props.name,
					TextSize = size,
					TextColor3 = p0.props.textStyle.Color,
					TextTransparency = p0.props.textStyle.Transparency,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextStrokeColor3 = p0.props.textStyle.StrokeColor,
					TextStrokeTransparency = p0.props.textStyle.StrokeTransparency,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			})
		end
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p0.props.layoutOrder,
			Size = p1.PlayerNameSize
		}, t)
	end)
end

local function PlayerNameTagContainer(p2) --[[ line: 183 ]]
	-- upvalues: usePlayerCombinedNameModule (ref), fFlagEnableVerifiedBadgeStore (ref), useVerifiedBadge (ref), reactModule (ref), playerNameTag (ref), cryoModule (ref)
	return reactModule.createElement(playerNameTag, cryoModule.Dictionary.join(p2, {
		name = usePlayerCombinedNameModule(tostring(p2.player.UserId), p2.player.DisplayName),
		hasVerifiedBadge = if fFlagEnableVerifiedBadgeStore then if fFlagEnableVerifiedBadgeStore then useVerifiedBadge(p2.player) else nil else nil
	}))
end

return if fFlagPlayerListReduceRerendersModule then reactModule.memo(PlayerNameTagContainer, createShallowEqualAndTablesModule({ "textFont" })) else PlayerNameTagContainer