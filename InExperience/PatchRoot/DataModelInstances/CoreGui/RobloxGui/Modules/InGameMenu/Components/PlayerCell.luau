local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(CorePackages.Packages.React)
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local Cryo = InGameMenuDependenciesModule.Cryo
local T = InGameMenuDependenciesModule.t
local Cell = UIBlox.App.Table.Cell
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local FoundationModule = require(CorePackages.Packages.Foundation)
local Image = FoundationModule.Image
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local LoadableImage = UIBlox.App.Loading.LoadableImage
local Images = UIBlox.App.ImageSet.Images
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local Parent = script.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local _UDim = UDim.new(0, 24)
local PlayerCell = Roact.PureComponent:extend("PlayerCell")
PlayerCell.validateProps = T.strictInterface({
	userId = T.number,
	username = T.string,
	displayName = T.optional(T.string),
	hasVerifiedBadge = T.optional(T.boolean),
	isOnline = T.optional(T.boolean),
	isSelected = T.optional(T.boolean),
	LayoutOrder = T.union(T.integer, T.table),
	Visible = T.optional(T.boolean),
	loadingStrategy = T.optional(UIBlox.App.Loading.Enum.LoadingStrategy.isEnumValue),
	onActivated = T.optional(T.callback),
	memoKey = T.optional(T.number),
	[Roact.Children] = T.optional(T.table),
	[Roact.Change.AbsolutePosition] = T.optional(T.callback),
	forwardRef = T.optional(T.union(T.callback, T.table)),
	UserInputService = T.optional(T.union(T.Instance, T.table))
})
PlayerCell.defaultProps = { Visible = true, UserInputService = UserInputService }

function PlayerCell.init(p1) --[[ Line: 71 ]]
	function p1.onActivated() --[[ Line: 72 ]]
		-- upvalues: p1 (copy)
		if p1.props.onActivated and p1.props.userId then
			p1.props.onActivated(p1.props.userId)
		end
	end
end

function PlayerCell.renderButtons(p1) --[[ Line: 79 ]]
	-- upvalues: Roact (copy), Cryo (copy)
	return (Cryo.Dictionary.join(p1.props[Roact.Children] or {}, {
		List = Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 5)
		})
	}))
end

function PlayerCell.renderWithSelectionCursor(p1, _) --[[ Line: 94 ]]
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), _UDim (copy), LoadableImage (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), ImageSetLabel (copy), Images (copy), AssetsModule (copy), Cell (copy), VerifiedBadgesModule (copy), ThemedTextLabelModule (copy)
	local Props = p1.props
	local Username = if Props.displayName == "" then Props.username else Props.displayName or Props.username
	
	return WithFoundationOrUIBloxStyleFunction(function(p2) --[[ Line: 104 ]]
		return {
			Theme = {
				BackgroundContrast = {
					Color = p2.Color.Surface.Surface_100.Color3,
					Transparency = p2.Color.Surface.Surface_100.Transparency
				},
				BackgroundOnHover = {
					Color = p2.Color.State.Hover.Color3,
					Transparency = p2.Color.State.Hover.Transparency
				},
				OnlineStatus = {
					Color = p2.Color.System.Success.Color3,
					Transparency = p2.Color.System.Success.Transparency
				}
			}
		}
	end, function(p2) --[[ Line: 112 ]]
		-- upvalues: p1 (copy), Roact (upval), _UDim (upval), LoadableImage (upval), Props (copy), FFlagCoreUiMigrateUIBloxToFoundation (upval), Image (upval), ImageSetLabel (upval), Images (upval), AssetsModule (upval), Cell (upval), VerifiedBadgesModule (upval), ThemedTextLabelModule (upval), Username (copy)
		local BackgroundContrast = p2.Theme.BackgroundContrast
		local v1 = 1.1
		
		if p1.props.isSelected then
			BackgroundContrast = p2.Theme.BackgroundOnHover
			v1 = 0.23
		end
		local Color = BackgroundContrast.Color
		local config = {
			Corner = Roact.createElement("UICorner", { CornerRadius = UDim.new(0, 3) }),
			Border = Roact.createElement("UIStroke", {
				Transparency = 0,
				Thickness = 2,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.new(Color.R * v1, Color.G * v1, Color.B * v1)
			})
		}
		local config1 = {
			BorderRadius = Roact.createElement("UICorner", { CornerRadius = _UDim }),
			PlayerIcon = Roact.createElement(LoadableImage, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				LayoutOrder = 1,
				useShimmerAnimationWhileLoading = true,
				loadingStrategy = p1.props.loadingStrategy,
				Size = UDim2.fromScale(1, 1),
				ImageColor3 = Props.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115),
				Image = Props.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. Props.userId .. "&w=60&h=60" or "",
				renderOnFailed = function() --[[ Line: 152 ]]
					-- upvalues: FFlagCoreUiMigrateUIBloxToFoundation (upval), Roact (upval), Image (upval), _UDim (upval), ImageSetLabel (upval), Images (upval)
					return if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
						Image = "icons/common/user",
						ZIndex = 2,
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 1),
						cornerRadius = _UDim
					}) else Roact.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						ZIndex = 2,
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 1),
						Image = Images["icons/common/user"]
					}, {
						Corner = Roact.createElement("UICorner", { CornerRadius = _UDim })
					})
				end,
				cornerRadius = _UDim
			}),
			OnlineIndicator = p1.props.isOnline and (if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
				ZIndex = 3,
				AnchorPoint = Vector2.new(1, 1),
				Image = AssetsModule.Images.Circle,
				imageStyle = {
					Transparency = 0,
					Color3 = Props.isOnline and p2.Theme.OnlineStatus.Color or nil
				},
				Position = UDim2.new(1, -3, 1, -3),
				Size = UDim2.new(0, 6, 0, 6)
			}, config) else Roact.createElement(ImageSetLabel, {
				ZIndex = 3,
				AnchorPoint = Vector2.new(1, 1),
				Image = AssetsModule.Images.Circle,
				ImageColor3 = Props.isOnline and p2.Theme.OnlineStatus.Color or nil,
				Position = UDim2.new(1, -3, 1, -3),
				Size = UDim2.new(0, 6, 0, 6)
			}, config)) or nil
		}
		
		return Roact.createElement(Cell, {
			background = p1.props.isSelected and Roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Color,
				BackgroundTransparency = BackgroundContrast.Transparency
			}) or nil,
			onActivated = p1.onActivated,
			[Roact.Change.AbsolutePosition] = p1.props[Roact.Change.AbsolutePosition],
			[Roact.Ref] = p1.props.forwardRef or nil,
			layoutOrder = Props.LayoutOrder,
			size = UDim2.new(1, 0, 0, 72),
			head = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0, 0),
				Size = UDim2.new(1, -20, 0, 72),
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				HeadListLayout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				AvatarBackground = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
					Image = "component_assets/userBG_dark",
					Size = UDim2.new(0, 48, 0, 48)
				}, config1) else Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = Images["component_assets/userBG_dark"],
					Size = UDim2.new(0, 48, 0, 48)
				}, config1),
				NameContainer = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, -68, 0, 72),
					Position = UDim2.fromOffset(48, 0),
					AnchorPoint = Vector2.new(0, 0.5)
				}, {
					NameListLayout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					NamePadding = Roact.createElement("UIPadding", { PaddingLeft = UDim.new(0, 6) }),
					DisplayNameLabel = Roact.createElement(VerifiedBadgesModule.EmojiWrapper, {
						emoji = if Props.hasVerifiedBadge then VerifiedBadgesModule.emoji.verified else "",
						automaticSize = Enum.AutomaticSize.None,
						size = UDim2.new(1, -40, 0, 20)
					}, {
						DisplayNameLabel = Roact.createElement(ThemedTextLabelModule, {
							fontKey = "CaptionHeader",
							themeKey = "TextEmphasis",
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Text = Username or Props.username,
							Size = UDim2.new(1, 0, 0, 20),
							AutomaticSize = if Props.hasVerifiedBadge then Enum.AutomaticSize.XY else Enum.AutomaticSize.None,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd
						})
					}),
					UsernameLabel = Roact.createElement(ThemedTextLabelModule, {
						fontKey = "Footer",
						themeKey = "TextDefault",
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						AnchorPoint = Vector2.new(0, 0.5),
						Size = UDim2.new(1, 0, 0, 14),
						Text = "@" .. Props.username,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd
					})
				})
			}),
			tail = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(0, 0, 1, 0)
			}, p1:renderButtons())
		})
	end)
end

function PlayerCell.render(p1) --[[ Line: 291 ]]
	-- upvalues: WithCursorMigration (copy)
	return WithCursorMigration(function(p2) --[[ Line: 292 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return ReactModule.memo(PlayerCell, function(p1, p2): boolean --[[ Line: 297 ]]
	-- upvalues: Roact (copy)
	return p1.isSelected == p2.isSelected and (p1.isOnline == p2.isOnline and (p1[Roact.Change.AbsolutePosition] == p2[Roact.Change.AbsolutePosition] and (p1.forwardRef == p2.forwardRef and p1.memoKey == p2.memoKey))) and p1.loadingStrategy == p2.loadingStrategy
end)