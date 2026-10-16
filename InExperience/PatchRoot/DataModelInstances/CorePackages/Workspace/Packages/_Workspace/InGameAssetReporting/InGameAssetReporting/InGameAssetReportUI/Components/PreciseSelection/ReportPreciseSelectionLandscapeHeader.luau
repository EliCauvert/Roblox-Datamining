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

local function _(Text) --[[ Line: 34 | Named "renderHeaderBarCenter" ]]
	-- upvalues: WithStyleFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	return function() --[[ Line: 35 ]]
		-- upvalues: WithStyleFunction (upval), ReactModule (upval), Text (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		return WithStyleFunction(function(p1) --[[ Line: 36 ]]
			-- upvalues: ReactModule (upval), Text (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
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
				Size = UDim2.new(1, 0, 1, 0)
			})
		end)
	end
end

local _ = function(OnActivated) --[[ Line: 59 | Named "renderHeaderBarLeft" ]]
	-- upvalues: ReactModule (copy), IconButton (copy), IconSize (copy), Images (copy)
	return function() --[[ Line: 60 ]]
		-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), OnActivated (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 120, 1, 0)
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

local _ = function(OnActivated, Text, Title, Text1, p1, OnClose) --[[ Line: 81 | Named "renderHeaderBarRight" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	return function() --[[ Line: 89 ]]
		-- upvalues: ReactModule (upval), FoundationModule (upval), Title (copy), Text1 (copy), p1 (copy), OnClose (copy), Button (upval), ButtonVariant (upval), InputSize (upval), OnActivated (copy), Text (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 144, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			CoachmarkWrapper = ReactModule.createElement(FoundationModule.Coachmark, {
				title = Title,
				text = Text1,
				isOpen = p1 or false,
				side = FoundationModule.Enums.PopoverSide.Bottom,
				align = FoundationModule.Enums.PopoverAlign.End,
				onClose = OnClose
			}, {
				NextButton = ReactModule.createElement(Button, {
					variant = ButtonVariant.Emphasis,
					inputSize = InputSize.Large,
					onActivated = OnActivated,
					text = Text,
					width = UDim.new(0, 144)
				})
			})
		})
	end
end

return function(p1) --[[ Line: 119 | Named "LandscapeModeHeader" ]]
	-- upvalues: ReactModule (copy), HeaderBar (copy), IconButton (copy), IconSize (copy), Images (copy), FoundationModule (copy), Button (copy), ButtonVariant (copy), InputSize (copy), WithStyleFunction (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local BackAction = p1.backAction
	
	local function RenderLeft() --[[ Line: 60 ]]
		-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), BackAction (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 120, 1, 0)
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
	
	local NextAction = p1.nextAction
	local NextText = p1.nextText
	local CoachmarkTitle = p1.coachmarkTitle
	local CoachmarkText = p1.coachmarkText
	local IsCoachmarkOpen = p1.isCoachmarkOpen
	local OnCoachmarkClose = p1.onCoachmarkClose
	
	local function RenderRight() --[[ Line: 89 ]]
		-- upvalues: ReactModule (upval), FoundationModule (upval), CoachmarkTitle (copy), CoachmarkText (copy), IsCoachmarkOpen (copy), OnCoachmarkClose (copy), Button (upval), ButtonVariant (upval), InputSize (upval), NextAction (copy), NextText (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 144, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			CoachmarkWrapper = ReactModule.createElement(FoundationModule.Coachmark, {
				title = CoachmarkTitle,
				text = CoachmarkText,
				isOpen = IsCoachmarkOpen or false,
				side = FoundationModule.Enums.PopoverSide.Bottom,
				align = FoundationModule.Enums.PopoverAlign.End,
				onClose = OnCoachmarkClose
			}, {
				NextButton = ReactModule.createElement(Button, {
					variant = ButtonVariant.Emphasis,
					inputSize = InputSize.Large,
					onActivated = NextAction,
					text = NextText,
					width = UDim.new(0, 144)
				})
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
		Size = UDim2.new(1, 0, 0, 71)
	}, {
		Bar = ReactModule.createElement(HeaderBar, {
			backgroundTransparency = 1,
			barHeight = 72,
			renderLeft = RenderLeft,
			renderRight = RenderRight,
			renderCenter = function() --[[ Line: 35 ]]
				-- upvalues: WithStyleFunction (upval), ReactModule (upval), TitleText (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
				return WithStyleFunction(function(p2) --[[ Line: 36 ]]
					-- upvalues: ReactModule (upval), TitleText (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
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
						Size = UDim2.new(1, 0, 1, 0)
					})
				end)
			end
		})
	})
end