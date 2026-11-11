local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local ReactModule = require(VirtualEvents.Parent.React)
local FoundationModule = require(VirtualEvents.Parent.Foundation)
local UIBloxModule = require(VirtualEvents.Parent.UIBlox)
local GamePlayButtonModule = require(VirtualEvents.Parent.GamePlayButton)
local RoactNetworking = require(VirtualEvents.Parent.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(VirtualEvents.Parent.RobloxAppHooks).useRoactService
local _ = require(VirtualEvents.Parent.VirtualEventsState)
local UseExperienceSubtitleModule = require(VirtualEvents.Hooks.useExperienceSubtitle)
local View = FoundationModule.View
local Button = FoundationModule.Button
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UsePlayButtonStateFunction = GamePlayButtonModule.usePlayButtonState
local PlayButtonStates = GamePlayButtonModule.PlayButtonStates

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseExperienceSubtitleModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UsePlayButtonStateFunction (copy), PlayButtonStates (copy), ReactModule (copy), Text (copy), View (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy), ButtonSize (copy), ImageSetLabel (copy), Images (copy)
	local UseTokensResult = UseTokensFunction()
	local UseExperienceSubtitleModuleResult = if p1.universeId then UseExperienceSubtitleModule(p1.universeId) else nil
	local UsePlayButtonStateResult = UsePlayButtonStateFunction(UseRoactServiceFunction(RoactNetworking), p1.universeId or "")
	local IsPlayButtonStateMatch: boolean = UsePlayButtonStateResult.playButtonState == PlayButtonStates.Playable or UsePlayButtonStateResult.playButtonState == PlayButtonStates.PlayableWithParty
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 16)
		}),
		UpperContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 40)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12)
			}),
			ExperienceThumbnail = ReactModule.createElement("ImageButton", {
				Active = true,
				Size = UDim2.fromOffset(40, 40),
				BorderSizePixel = 0,
				Image = ("rbxthumb://type=GameIcon&id=%s&w=150&h=150"):format(p1.universeId),
				[ReactModule.Event.Activated] = p1.onExperienceTileActivated
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
			}),
			EventInfo = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, -52, 1, 0)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				ExperienceName = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					TextWrapped = false,
					Size = UDim2.fromScale(1, if UseExperienceSubtitleModuleResult then 0.5 else 1),
					Text = p1.experienceName,
					textStyle = UseTokensResult.Color.Content.Emphasis,
					fontStyle = UseTokensResult.Typography.TitleLarge,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.SplitWord
				}),
				ExperienceSubtitle = if UseExperienceSubtitleModuleResult then ReactModule.createElement(Text, {
					LayoutOrder = 2,
					TextWrapped = false,
					Size = UDim2.fromScale(1, 0.5),
					Text = UseExperienceSubtitleModuleResult,
					textStyle = UseTokensResult.Color.Content.Default,
					fontStyle = UseTokensResult.Typography.BodyLarge,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.None
				}) else nil
			})
		}),
		LowerContianer = if p1.ctaProps.button then ReactModule.createElement(View, {
			LayoutOrder = 2,
			size = UDim2.new(1, 0, 0, 40),
			tag = {
				["row gap-small wrap auto-y size-full-0"] = true,
				["fill-x"] = true
			}
		}, {
			CTAButton = ReactModule.createElement(Button, {
				text = p1.ctaProps.button.text,
				variant = ButtonVariant[p1.ctaProps.button.variant],
				onActivated = if IsPlayButtonStateMatch then p1.ctaProps.button.onActivated else function() end,
				fillBehavior = FillBehavior.Fill,
				size = ButtonSize.Medium,
				isDisabled = not IsPlayButtonStateMatch
			}),
			ShareButtonWrapper = if p1.ctaProps.icon then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(40, 40)
			}, {
				ShareButton = ReactModule.createElement(Button, {
					variant = ButtonVariant.Standard,
					onActivated = if IsPlayButtonStateMatch then p1.ctaProps.icon.onActivated else function() end,
					fillBehavior = FillBehavior.Fill,
					size = ButtonSize.Medium,
					isDisabled = not IsPlayButtonStateMatch
				}),
				ShareIcon = ReactModule.createElement(ImageSetLabel, {
					ZIndex = 2,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(32, 32),
					Image = Images[p1.ctaProps.icon.icon],
					Position = UDim2.fromOffset(4, 4)
				})
			}) else nil
		}) else nil
	})
end