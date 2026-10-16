local Parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local WithStyleFunction = UIBloxModule.Style.withStyle

local function _(OnActivated) --[[ Line: 38 | Named "renderHeaderBarLeft" ]]
	-- upvalues: ReactModule (copy), IconButton (copy), IconSize (copy), Images (copy)
	return function() --[[ Line: 39 ]]
		-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), OnActivated (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 30, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			BackButton = ReactModule.createElement(IconButton, {
				layoutOrder = 1,
				iconSize = IconSize.Medium,
				icon = Images["icons/navigation/pushBack"],
				onActivated = OnActivated
			})
		})
	end
end

local _ = function(Text) --[[ Line: 60 | Named "renderHeaderBarCenter" ]]
	-- upvalues: WithStyleFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	return function() --[[ Line: 61 ]]
		-- upvalues: WithStyleFunction (upval), ReactModule (upval), Text (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		return WithStyleFunction(function(p1) --[[ Line: 62 ]]
			-- upvalues: ReactModule (upval), Text (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
			local CurrentCamera = game.Workspace.CurrentCamera
			local Theme = p1.Theme
			local _Font = p1.Font
			
			return ReactModule.createElement("TextLabel", {
				TextSize = 20,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = Text,
				Font = if FoundationFontFaceMigration then nil else _Font.Header2.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.TitleLarge.Font) else nil,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(0, if CurrentCamera == nil then 300 else CurrentCamera.ViewportSize.X - 150, 1, 0)
			})
		end)
	end
end

local _ = function() --[[ Line: 92 | Named "renderHeaderBarRight" ]]
	-- upvalues: ReactModule (copy)
	return function() --[[ Line: 93 ]]
		-- upvalues: ReactModule (upval)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 60, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		})
	end
end

return {
	PortraitModeHeader = function(p1) --[[ Line: 108 ]]
		-- upvalues: ReactModule (copy), HeaderBar (copy), IconButton (copy), IconSize (copy), Images (copy), WithStyleFunction (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
		local BackAction = p1.backAction
		
		local function RenderLeft() --[[ Line: 39 ]]
			-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), BackAction (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 30, 1, 0)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				BackButton = ReactModule.createElement(IconButton, {
					layoutOrder = 1,
					iconSize = IconSize.Medium,
					icon = Images["icons/navigation/pushBack"],
					onActivated = BackAction
				})
			})
		end
		
		local TitleText = p1.titleText
		
		return ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 0.1,
			LayoutOrder = 1,
			ZIndex = 2,
			BackgroundColor3 = Color3.fromHex("#000000"),
			Size = UDim2.new(1, 0, 0, 72)
		}, {
			Bar = ReactModule.createElement(HeaderBar, {
				backgroundTransparency = 1,
				barHeight = 72,
				margin = 12,
				isSecondary = true,
				renderLeft = RenderLeft,
				renderRight = function() --[[ Line: 93 ]]
					-- upvalues: ReactModule (upval)
					return ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 60, 1, 0)
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder
						})
					})
				end,
				renderCenter = function() --[[ Line: 61 ]]
					-- upvalues: WithStyleFunction (upval), ReactModule (upval), TitleText (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
					return WithStyleFunction(function(p2) --[[ Line: 62 ]]
						-- upvalues: ReactModule (upval), TitleText (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
						local CurrentCamera = game.Workspace.CurrentCamera
						local Theme = p2.Theme
						local _Font = p2.Font
						
						return ReactModule.createElement("TextLabel", {
							TextSize = 20,
							TextWrapped = true,
							BackgroundTransparency = 1,
							Text = TitleText,
							Font = if FoundationFontFaceMigration then nil else _Font.Header2.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.TitleLarge.Font) else nil,
							TextColor3 = Theme.TextEmphasis.Color,
							TextTransparency = Theme.TextEmphasis.Transparency,
							TextXAlignment = Enum.TextXAlignment.Center,
							TextYAlignment = Enum.TextYAlignment.Center,
							Size = UDim2.new(0, if CurrentCamera == nil then 300 else CurrentCamera.ViewportSize.X - 150, 1, 0)
						})
					end)
				end
			})
		})
	end,
	PortraitModeFooter = function(p1) --[[ Line: 129 ]]
		-- upvalues: ReactModule (copy), FoundationModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
		return ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 0.1,
			LayoutOrder = 4,
			Size = UDim2.new(1, 0, 0, 60),
			BackgroundColor3 = Color3.fromHex("#000000"),
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			CoachmarkWrapper = ReactModule.createElement(FoundationModule.Coachmark, {
				title = p1.coachmarkTitle,
				text = p1.coachmarkText,
				isOpen = p1.isCoachmarkOpen or false,
				side = FoundationModule.Enums.PopoverSide.Top,
				align = FoundationModule.Enums.PopoverAlign.Center,
				onClose = p1.onCoachmarkClose
			}, {
				NextButton = ReactModule.createElement(Button, {
					variant = ButtonVariant.Emphasis,
					inputSize = InputSize.Large,
					width = UDim.new(0, 400),
					onActivated = p1.nextAction,
					text = p1.nextText
				})
			})
		})
	end
}