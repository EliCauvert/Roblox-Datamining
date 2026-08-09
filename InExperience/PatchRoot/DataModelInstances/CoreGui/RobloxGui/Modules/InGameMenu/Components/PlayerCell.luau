local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local reactModule = require(corePackagesService.Packages.React)
local verifiedBadgesModule = require(corePackagesService.Workspace.Packages.VerifiedBadges)
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local cell = UIBlox.App.Table.Cell
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local loadableImage = UIBlox.App.Loading.LoadableImage
local loadingStrategy = UIBlox.App.Loading.Enum.LoadingStrategy
local images = UIBlox.App.ImageSet.Images
local withStyle = UIBlox.Core.Style.withStyle
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local parent = script.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local uDim = UDim.new(0, 24)
local playerCell = roact.PureComponent:extend("PlayerCell")
playerCell.validateProps = t.strictInterface({
	userId = t.number,
	username = t.string,
	displayName = t.optional(t.string),
	hasVerifiedBadge = t.optional(t.boolean),
	isOnline = t.optional(t.boolean),
	isSelected = t.optional(t.boolean),
	LayoutOrder = t.union(t.integer, t.table),
	Visible = t.optional(t.boolean),
	loadingStrategy = t.optional(loadingStrategy.isEnumValue),
	onActivated = t.optional(t.callback),
	memoKey = t.optional(t.number),
	[roact.Children] = t.optional(t.table),
	[roact.Change.AbsolutePosition] = t.optional(t.callback),
	forwardRef = t.optional(t.union(t.callback, t.table)),
	UserInputService = t.optional(t.union(t.Instance, t.table))
})
playerCell.defaultProps = { Visible = true, UserInputService = userInputService }

function playerCell.init(p0) --[[ line: 63 ]]
	function p0.onActivated() --[[ line: 64 ]]
		-- upvalues: p0 (ref)
		if p0.props.onActivated and p0.props.userId then
			p0.props.onActivated(p0.props.userId)
		end
	end
end

function playerCell.renderButtons(p1) --[[ line: 71 ]]
	-- upvalues: roact (ref), cryo (ref)
	return cryo.Dictionary.join(p1.props[roact.Children] or {}, {
		List = roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 5)
		})
	})
end

function playerCell.renderWithSelectionCursor(p2, _) --[[ line: 86 ]]
	-- upvalues: withStyle (ref), roact (ref), cell (ref), imageSetLabel (ref), images (ref), uDim (ref), loadableImage (ref), assetsModule (ref), verifiedBadgesModule (ref), themedTextLabelModule (ref)
	local props = p2.props
	local var9 = if props.displayName ~= "" then props.displayName else props.username
	
	return withStyle(function(p3) --[[ line: 96 ]]
		-- upvalues: p2 (ref), roact (copy), cell (copy), props (ref), imageSetLabel (copy), images (copy), uDim (copy), loadableImage (copy), assetsModule (copy), verifiedBadgesModule (copy), themedTextLabelModule (copy), var9 (ref)
		local backgroundContrast = p3.Theme.BackgroundContrast
		local var10 = 1.1
		
		if p2.props.isSelected then
			backgroundContrast = p3.Theme.BackgroundOnHover
			var10 = 0.23
		end
		local color = backgroundContrast.Color
		
		return roact.createElement(cell, {
			background = p2.props.isSelected and roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = color,
				BackgroundTransparency = backgroundContrast.Transparency
			}) or nil,
			onActivated = p2.onActivated,
			[roact.Change.AbsolutePosition] = p2.props[roact.Change.AbsolutePosition],
			[roact.Ref] = p2.props.forwardRef or nil,
			layoutOrder = props.LayoutOrder,
			size = UDim2.new(1, 0, 0, 72),
			head = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0, 0),
				Size = UDim2.new(1, -20, 0, 72),
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				HeadListLayout = roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				AvatarBackground = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Image = images["component_assets/userBG_dark"],
					Size = UDim2.new(0, 48, 0, 48)
				}, {
					BorderRadius = roact.createElement("UICorner", { CornerRadius = uDim }),
					PlayerIcon = roact.createElement(loadableImage, {
						BackgroundTransparency = 1,
						ZIndex = 2,
						LayoutOrder = 1,
						useShimmerAnimationWhileLoading = true,
						loadingStrategy = p2.props.loadingStrategy,
						Size = UDim2.fromScale(1, 1),
						ImageColor3 = props.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115),
						Image = if props.userId > 0 then "rbxthumb://type=AvatarHeadShot&id=" .. props.userId .. "&w=60&h=60" else "",
						renderOnFailed = function() --[[ line: 149 ]]
							-- upvalues: roact (copy), imageSetLabel (copy), images (copy), uDim (copy)
							return roact.createElement(imageSetLabel, {
								BackgroundTransparency = 1,
								ZIndex = 2,
								LayoutOrder = 1,
								Size = UDim2.fromScale(1, 1),
								Image = images["icons/common/user"]
							}, {
								Corner = roact.createElement("UICorner", { CornerRadius = uDim })
							})
						end,
						cornerRadius = uDim
					}),
					OnlineIndicator = p2.props.isOnline and (roact.createElement(imageSetLabel, {
						ZIndex = 3,
						AnchorPoint = Vector2.new(1, 1),
						Image = assetsModule.Images.Circle,
						ImageColor3 = if props.isOnline then p3.Theme.OnlineStatus.Color else nil,
						Position = UDim2.new(1, -3, 1, -3),
						Size = UDim2.new(0, 6, 0, 6)
					}, {
						Corner = roact.createElement("UICorner", { CornerRadius = UDim.new(0, 3) }),
						Border = roact.createElement("UIStroke", {
							Transparency = 0,
							Thickness = 2,
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Color = Color3.new(color.R * var10, color.G * var10, color.B * var10)
						})
					}) or nil)
				}),
				NameContainer = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, -68, 0, 72),
					Position = UDim2.fromOffset(48, 0),
					AnchorPoint = Vector2.new(0, 0.5)
				}, {
					NameListLayout = roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					NamePadding = roact.createElement("UIPadding", { PaddingLeft = UDim.new(0, 6) }),
					DisplayNameLabel = roact.createElement(verifiedBadgesModule.EmojiWrapper, {
						emoji = if props.hasVerifiedBadge then verifiedBadgesModule.emoji.verified else "",
						automaticSize = Enum.AutomaticSize.None,
						size = UDim2.new(1, -40, 0, 20)
					}, {
						DisplayNameLabel = roact.createElement(themedTextLabelModule, {
							fontKey = "CaptionHeader",
							themeKey = "TextEmphasis",
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Text = var9 or props.username,
							Size = UDim2.new(1, 0, 0, 20),
							AutomaticSize = if props.hasVerifiedBadge then Enum.AutomaticSize.XY else Enum.AutomaticSize.None,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd
						})
					}),
					UsernameLabel = roact.createElement(themedTextLabelModule, {
						fontKey = "Footer",
						themeKey = "TextDefault",
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						AnchorPoint = Vector2.new(0, 0.5),
						Size = UDim2.new(1, 0, 0, 14),
						Text = "@" .. props.username,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd
					})
				})
			}),
			tail = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(0, 0, 1, 0)
			}, p2:renderButtons())
		})
	end)
end

function playerCell.render(p4) --[[ line: 245 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p5) --[[ line: 246 ]]
		-- upvalues: p4 (ref)
		return p4:renderWithSelectionCursor(p5)
	end)
end

return reactModule.memo(playerCell, function(p6, p7) --[[ line: 251 ]]
	-- upvalues: roact (ref)
	return p6.isSelected == p7.isSelected and (p6.isOnline == p7.isOnline and (p6[roact.Change.AbsolutePosition] == p7[roact.Change.AbsolutePosition] and (p6.forwardRef == p7.forwardRef and (p6.memoKey == p7.memoKey and p6.loadingStrategy == p7.loadingStrategy))))
end)