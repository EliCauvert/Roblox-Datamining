local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local parent = script.Parent.Parent
local fFlagLuaMenuPerfImprovementsModule = require(parent.Flags.FFlagLuaMenuPerfImprovements)
local assetsModule = require(parent.Resources.Assets)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local foundationModule = require(corePackagesService.Packages.Foundation)
local image = foundationModule.Image
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var6 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var7 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local openTypeSupport = UIBlox.Utility.OpenTypeSupport
local t_1 = {
	AnchorPoint = Vector2.new(0, 0.5),
	Position = UDim2.new(0, 24, 0.5, 0),
	Size = UDim2.new(0, 44, 0, 44)
}
local validatePropsWithForwardRef = require(corePackagesService.Workspace.Packages.RoactUtils).validatePropsWithForwardRef
local getFFlagLuaAppEnableOpenTypeSupport = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local getFFlagLuaAppEnableOpenTypeIGMFix = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeIGMFix
local playerLabel = roact.PureComponent:extend("PlayerLabel")
playerLabel.validateProps = t.strictInterface(validatePropsWithForwardRef({
	userId = t.number,
	username = t.string,
	isOnline = t.boolean,
	isSelected = t.boolean,
	LayoutOrder = t.integer,
	Visible = t.optional(t.boolean),
	onActivated = t.optional(t.callback),
	[roact.Children] = t.optional(t.table),
	[roact.Change.AbsolutePosition] = t.optional(t.callback),
	[roact.Ref] = t.optional(t.union(t.callback, t.table))
}))
playerLabel.defaultProps = { Visible = true }

if fFlagLuaMenuPerfImprovementsModule then
	function playerLabel.init(p0) --[[ line: 82 ]]
		function p0.onActivated() --[[ line: 83 ]]
			-- upvalues: p0 (ref)
			p0.props.onActivated(p0.props.userId)
		end
	end
end
function playerLabel.renderButtons(p1) --[[ line: 89 ]]
	-- upvalues: roact (ref), cryo (ref)
	return cryo.Dictionary.join(p1.props[roact.Children] or {}, {
		List = roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		})
	})
end

function playerLabel.renderWithSelectionCursor(p2, p3) --[[ line: 104 ]]
	-- upvalues: withFoundationOrUIBloxStyle (ref), fFlagLuaMenuPerfImprovementsModule (ref), roact (ref), var7 (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), cryo (ref), t_1 (ref), assetsModule (ref), imageSetLabel (ref), themedTextLabelModule (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), getFFlagLuaAppEnableOpenTypeIGMFix (ref), openTypeSupport (ref)
	local props = p2.props
	
	return withFoundationOrUIBloxStyle(function(p4) --[[ line: 107 ]]
		return {
			Theme = {
				BackgroundContrast = {
					Color = p4.Color.Surface.Surface_100.Color3,
					Transparency = p4.Color.Surface.Surface_100.Transparency
				},
				UIDefault = {
					Color = p4.Color.Shift.Shift_200.Color3,
					Transparency = p4.Color.Shift.Shift_200.Transparency
				},
				OnlineStatus = {
					Color = p4.Color.System.Success.Color3,
					Transparency = p4.Color.System.Success.Transparency
				}
			}
		}
	end, function(p5) --[[ line: 115 ]]
		-- upvalues: p2 (ref), fFlagLuaMenuPerfImprovementsModule (copy), roact (copy), props (ref), p3 (ref), var7 (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), cryo (copy), t_1 (copy), assetsModule (copy), imageSetLabel (copy), themedTextLabelModule (copy), getFFlagLuaAppEnableOpenTypeSupport (copy), getFFlagLuaAppEnableOpenTypeIGMFix (copy), openTypeSupport (copy)
		local var10 = if p2.props.isSelected then { Transparency = 0, Color = Color3.fromRGB(48, 50, 52) } else p5.Theme.BackgroundContrast
		
		return roact.createElement("TextButton", {
			BackgroundTransparency = var10.Transparency,
			BackgroundColor3 = var10.Color,
			BorderSizePixel = 0,
			LayoutOrder = props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 70),
			Visible = props.Visible,
			Text = "",
			AutoButtonColor = false,
			[roact.Event.Activated] = if fFlagLuaMenuPerfImprovementsModule then if p2.props.onActivated then p2.onActivated else nil else p2.props.onActivated,
			[roact.Change.AbsolutePosition] = p2.props[roact.Change.AbsolutePosition],
			[roact.Ref] = p2.props.forwardRef,
			SelectionImageObject = p3(var7.Square)
		}, {
			PlayerCutout = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, cryo.Dictionary.join(t_1, {
				ZIndex = 3,
				Image = assetsModule.Images.CircleCutout,
				imageStyle = { Transparency = 0, Color3 = var10.Color }
			})) else roact.createElement(imageSetLabel, cryo.Dictionary.join(t_1, {
				BackgroundTransparency = 1,
				ZIndex = 3,
				Image = assetsModule.Images.CircleCutout,
				ImageColor3 = var10.Color
			})),
			PlayerIcon = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, cryo.Dictionary.join(t_1, {
				ZIndex = 2,
				Image = if props.userId > 0 then "rbxthumb://type=AvatarHeadShot&id=" .. props.userId .. "&w=48&h=48" else ""
			})) else roact.createElement(imageSetLabel, cryo.Dictionary.join(t_1, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Image = if props.userId > 0 then "rbxthumb://type=AvatarHeadShot&id=" .. props.userId .. "&w=48&h=48" else ""
			})),
			PlayerBackground = roact.createElement("Frame", cryo.Dictionary.join(t_1, {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				BackgroundColor3 = p5.Theme.UIDefault.Color
			})),
			OnlineIndicator = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
				AnchorPoint = Vector2.new(0, 0.5),
				Image = assetsModule.Images.Circle,
				imageStyle = {
					Transparency = 0,
					Color3 = if props.isOnline then p5.Theme.OnlineStatus.Color else p5.Theme.UIDefault.Color
				},
				Position = UDim2.new(0, 80, 0.5, 0),
				Size = UDim2.new(0, 16, 0, 16)
			}) else roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Image = assetsModule.Images.Circle,
				ImageColor3 = if props.isOnline then p5.Theme.OnlineStatus.Color else p5.Theme.UIDefault.Color,
				Position = UDim2.new(0, 80, 0.5, 0),
				Size = UDim2.new(0, 16, 0, 16)
			}),
			UsernameLabel = roact.createElement(themedTextLabelModule, {
				fontKey = "Header2",
				themeKey = "TextEmphasis",
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 100, 0.5, 0),
				Size = UDim2.new(0, 219, 0, 22),
				Text = props.username,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				OpenTypeFeatures = if getFFlagLuaAppEnableOpenTypeSupport() and getFFlagLuaAppEnableOpenTypeIGMFix() then openTypeSupport:getUserNameStylisticAlternative() else nil
			}),
			ButtonContainer = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -24, 0, 0),
				Size = UDim2.new(0, 0, 1, 0)
			}, p2:renderButtons())
		})
	end)
end

function playerLabel.render(p6) --[[ line: 234 ]]
	-- upvalues: var6 (ref)
	return var6(function(p7) --[[ line: 235 ]]
		-- upvalues: p6 (ref)
		return p6:renderWithSelectionCursor(p7)
	end)
end

return roact.forwardRef(function(p8, p9) --[[ line: 240 ]]
	-- upvalues: roact (ref), playerLabel (ref), cryo (ref)
	return roact.createElement(playerLabel, cryo.Dictionary.join(p8, { forwardRef = p9 }))
end)