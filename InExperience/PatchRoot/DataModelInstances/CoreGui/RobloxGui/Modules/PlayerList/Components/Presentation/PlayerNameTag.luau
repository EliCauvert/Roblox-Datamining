local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local TModule = require(CorePackages.Packages.t)
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local CryoModule = require(CorePackages.Packages.Cryo)
local FoundationFontFaceMigration = require(CorePackages.Packages.Foundation).Utility.Flags.FoundationFontFaceMigration
local Parent = script.Parent.Parent.Parent
local WithLayoutValuesFunction = require(Parent.Components.Connection.LayoutValues).WithLayoutValues
local UsePlayerCombinedNameModule = require(Parent.Hooks.usePlayerCombinedName)
local CreateShallowEqualAndTablesModule = require(Parent.createShallowEqualAndTables)
local FFlagPlayerListReduceRerendersModule = require(Parent.Flags.FFlagPlayerListReduceRerenders)
local UseVerifiedBadgeFunction = require(CorePackages.Workspace.Packages.UserProfiles).Hooks.useVerifiedBadge
local FFlagEnableVerifiedBadgeStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore
local PlayerNameTag = ReactModule.PureComponent:extend("PlayerNameTag")
PlayerNameTag.validateProps = TModule.strictInterface({
	player = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Interfaces.playerInterface),
	isTitleEntry = TModule.boolean,
	isHovered = TModule.boolean,
	layoutOrder = TModule.integer,
	name = TModule.union(TModule.string, TModule.table),
	hasVerifiedBadge = TModule.optional(TModule.boolean),
	textStyle = TModule.strictInterface({
		Color = TModule.Color3,
		Transparency = TModule.number,
		StrokeColor = TModule.optional(TModule.Color3),
		StrokeTransparency = TModule.optional(TModule.number)
	}),
	textFont = TModule.strictInterface({
		Size = TModule.number,
		MinSize = TModule.number,
		Font = TModule.enum(Enum.Font),
		FontFace = TModule.optional(TModule.typeof("Font"))
	})
})

function PlayerNameTag.render(p1) --[[ Line: 68 ]]
	-- upvalues: WithLayoutValuesFunction (copy), FFlagEnableVerifiedBadgeStore (copy), UserLibModule (copy), ReactModule (copy), VerifiedBadgesModule (copy), FoundationFontFaceMigration (copy)
	return WithLayoutValuesFunction(function(p2) --[[ Line: 69 ]]
		-- upvalues: p1 (copy), FFlagEnableVerifiedBadgeStore (upval), UserLibModule (upval), ReactModule (upval), VerifiedBadgesModule (upval), FoundationFontFaceMigration (upval)
		local IconSelectedColor = if p1.props.isHovered then p2.IconSelectedColor else p2.IconUnSelectedColor
		local TextFontFont = p1.props.textFont.Font
		local FontFace = p1.props.textFont.FontFace
		local Size = p1.props.textFont.Size
		local t = {}
		local PlatformName = p1.props.player.PlatformName
		local HasVerifiedBadge = if FFlagEnableVerifiedBadgeStore then p1.props.hasVerifiedBadge else UserLibModule.Utils.isPlayerVerified(p1.props.player)
		
		if p2.IsTenFoot and PlatformName ~= "" then
			t.VerticalLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 10)
			})
			t.PlayerPlatformName = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 0.35, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = Enum.Font.SourceSans,
				TextSize = Size,
				TextColor3 = p1.props.textStyle.Color,
				TextTransparency = p1.props.textStyle.Transparency,
				TextStrokeColor3 = p1.props.textStyle.StrokeColor,
				TextStrokeTransparency = p1.props.textStyle.StrokeTransparency,
				Text = PlatformName
			})
			t.RobloxNameFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0.45, 0)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 6)
				}),
				RobloxIcon = ReactModule.createElement("ImageButton", {
					BackgroundTransparency = 1,
					Selectable = false,
					LayoutOrder = 1,
					Size = UDim2.new(0, 24, 0, 24),
					Image = p2.RobloxIconImage,
					ImageColor3 = IconSelectedColor
				}),
				PlayerNameContainer = ReactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
					layoutOrder = 2,
					mockIsEnrolled = true,
					emoji = if HasVerifiedBadge then VerifiedBadgesModule.emoji.verified else "",
					size = UDim2.new(1, -30, 0, 0),
					automaticSize = Enum.AutomaticSize.Y,
					verticalAlignment = Enum.VerticalAlignment.Center
				}, {
					PlayerName = ReactModule.createElement("TextLabel", {
						ClipsDescendants = false,
						BackgroundTransparency = 1,
						AutomaticSize = Enum.AutomaticSize.X,
						Size = UDim2.fromScale(0, 1),
						Font = if FoundationFontFaceMigration then nil else TextFontFont,
						FontFace = if FoundationFontFaceMigration then FontFace else nil,
						Text = p1.props.name,
						TextSize = Size,
						TextColor3 = p1.props.textStyle.Color,
						TextTransparency = p1.props.textStyle.Transparency,
						TextStrokeColor3 = p1.props.textStyle.StrokeColor,
						TextStrokeTransparency = p1.props.textStyle.StrokeTransparency,
						TextTruncate = Enum.TextTruncate.AtEnd,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				})
			})
		else
			t.PlayerNameContainer = ReactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
				mockIsEnrolled = true,
				emoji = if HasVerifiedBadge then VerifiedBadgesModule.emoji.verified else "",
				anchorPoint = Vector2.new(0, 0.5),
				position = UDim2.fromScale(0, 0.5),
				verticalAlignment = Enum.VerticalAlignment.Center,
				automaticSize = Enum.AutomaticSize.X,
				size = UDim2.new(0, 0, 0, Size)
			}, {
				PlayerName = ReactModule.createElement("TextLabel", {
					TextScaled = false,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.fromScale(0, 1),
					Font = if FoundationFontFaceMigration then nil else TextFontFont,
					FontFace = if FoundationFontFaceMigration then FontFace else nil,
					Text = p1.props.name,
					TextSize = Size,
					TextColor3 = p1.props.textStyle.Color,
					TextTransparency = p1.props.textStyle.Transparency,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextStrokeColor3 = p1.props.textStyle.StrokeColor,
					TextStrokeTransparency = p1.props.textStyle.StrokeTransparency,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			})
		end
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			Size = p2.PlayerNameSize
		}, t)
	end)
end

local function PlayerNameTagContainer(p1) --[[ Line: 190 ]]
	-- upvalues: UsePlayerCombinedNameModule (copy), FFlagEnableVerifiedBadgeStore (copy), UseVerifiedBadgeFunction (copy), ReactModule (copy), PlayerNameTag (copy), CryoModule (copy)
	local UseVerifiedBadgeResult = if FFlagEnableVerifiedBadgeStore then UseVerifiedBadgeFunction(p1.player) else nil
	
	return ReactModule.createElement(PlayerNameTag, CryoModule.Dictionary.join(p1, {
		name = UsePlayerCombinedNameModule(tostring(p1.player.UserId), p1.player.DisplayName),
		hasVerifiedBadge = if FFlagEnableVerifiedBadgeStore then UseVerifiedBadgeResult else nil
	}))
end

return if FFlagPlayerListReduceRerendersModule then ReactModule.memo(PlayerNameTagContainer, CreateShallowEqualAndTablesModule({ "textFont" })) else PlayerNameTagContainer