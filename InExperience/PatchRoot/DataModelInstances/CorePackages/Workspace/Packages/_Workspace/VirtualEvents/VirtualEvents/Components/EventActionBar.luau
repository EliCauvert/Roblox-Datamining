local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local foundationModule = require(virtualEvents.Parent.Foundation)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local gamePlayButtonModule = require(virtualEvents.Parent.GamePlayButton)
local roactNetworking = require(virtualEvents.Parent.RoactServiceTags).RoactNetworking
local useRoactService = require(virtualEvents.Parent.RobloxAppHooks).useRoactService
local _ = require(virtualEvents.Parent.VirtualEventsState)
local useExperienceSubtitleModule = require(virtualEvents.Hooks.useExperienceSubtitle)
local view = foundationModule.View
local button = foundationModule.Button
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local usePlayButtonState = gamePlayButtonModule.usePlayButtonState
local playButtonStates = gamePlayButtonModule.PlayButtonStates

return function(p0)
	-- upvalues: useTokens (ref), useExperienceSubtitleModule (ref), useRoactService (ref), roactNetworking (ref), usePlayButtonState (ref), playButtonStates (ref), reactModule (ref), text (ref), view (ref), button (ref), buttonVariant (ref), fillBehavior (ref), buttonSize (ref), imageSetLabel (ref), images (ref)
	local var6 = useTokens()
	local var7 = if p0.universeId then useExperienceSubtitleModule(p0.universeId) else nil
	local var8 = usePlayButtonState(useRoactService(roactNetworking), p0.universeId or "")
	local var9 = if var8.playButtonState ~= playButtonStates.Playable then var8.playButtonState == playButtonStates.PlayableWithParty else true
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 16)
		}),
		UpperContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 40)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 12)
			}),
			ExperienceThumbnail = reactModule.createElement("ImageButton", {
				Active = true,
				Size = UDim2.fromOffset(40, 40),
				BorderSizePixel = 0,
				Image = ("rbxthumb://type=GameIcon&id=%s&w=150&h=150"):format(p0.universeId),
				[reactModule.Event.Activated] = p0.onExperienceTileActivated
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
			}),
			EventInfo = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, -52, 1, 0)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				}),
				ExperienceName = reactModule.createElement(text, {
					LayoutOrder = 1,
					TextWrapped = false,
					Size = UDim2.fromScale(1, if var7 then 0.5 else 1),
					Text = p0.experienceName,
					textStyle = var6.Color.Content.Emphasis,
					fontStyle = var6.Typography.TitleLarge,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.SplitWord
				}),
				ExperienceSubtitle = if var7 then reactModule.createElement(text, {
					LayoutOrder = 2,
					TextWrapped = false,
					Size = UDim2.fromScale(1, 0.5),
					Text = var7,
					textStyle = var6.Color.Content.Default,
					fontStyle = var6.Typography.BodyLarge,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextTruncate = Enum.TextTruncate.None
				}) else nil
			})
		}),
		LowerContianer = if p0.ctaProps.button then reactModule.createElement(view, {
			LayoutOrder = 2,
			size = UDim2.new(1, 0, 0, 40),
			tag = {
				["row gap-small wrap auto-y size-full-0"] = true,
				["fill-x"] = true
			}
		}, {
			CTAButton = reactModule.createElement(button, {
				text = p0.ctaProps.button.text,
				variant = buttonVariant[p0.ctaProps.button.variant],
				onActivated = if var9 then p0.ctaProps.button.onActivated else function() end,
				fillBehavior = fillBehavior.Fill,
				size = buttonSize.Medium,
				isDisabled = not var9
			}),
			ShareButtonWrapper = if p0.ctaProps.icon then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(40, 40)
			}, {
				ShareButton = reactModule.createElement(button, {
					variant = buttonVariant.Standard,
					onActivated = if var9 then p0.ctaProps.icon.onActivated else function() end,
					fillBehavior = fillBehavior.Fill,
					size = buttonSize.Medium,
					isDisabled = not var9
				}),
				ShareIcon = reactModule.createElement(imageSetLabel, {
					ZIndex = 2,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(32, 32),
					Image = images[p0.ctaProps.icon.icon],
					Position = UDim2.fromOffset(4, 4)
				})
			}) else nil
		}) else nil
	})
end