local reactModule = require(game:GetService("CorePackages").Packages.React)
local parent = script.Parent.Parent
local FTUXSlideshowDataModule = require(parent.Resources.FTUXSlideshowData)
local FTUXConstantsModule = require(parent.Resources.FTUXConstants)
local _ = require(parent.Enums.PlatformEnum)
local headerModule = require(parent.Components.Slideshow.Header)
local stepperModule = require(parent.Components.Slideshow.Stepper)
local titleModule = require(parent.Components.Slideshow.Title)
local descriptionModule = require(parent.Components.Slideshow.Description)
local endItemModule = require(parent.Components.Slideshow.EndItem)
local eventHandlerModule = require(parent.Events.EventHandler)

return function(p0) --[[ line: 24 | named "FTUXSlideshow" ]]
	-- upvalues: reactModule (ref), FTUXSlideshowDataModule (ref), FTUXConstantsModule (ref), eventHandlerModule (ref), headerModule (ref), titleModule (ref), descriptionModule (ref), stepperModule (ref), endItemModule (ref)
	local var9, var10 = reactModule.useState(1)
	local platform = p0.platform
	local var11 = FTUXSlideshowDataModule[platform]
	local panelConstants = FTUXConstantsModule[platform].PanelConstants
	local var12 = var11[var9]
	local CONTENT_HEIGHT_RATIO = panelConstants.CONTENT_HEIGHT_RATIO
	local FOOTER_HEIGHT_RATIO = panelConstants.FOOTER_HEIGHT_RATIO
	local var13 = panelConstants.CONTENT_PADDING / panelConstants.SLIDESHOW_FRAME_WIDTH
	local var14 = 1 - 2 * var13
	local var15 = reactModule.useCallback(function() --[[ line: 37 ]]
		-- upvalues: var10 (ref), var9 (ref)
		var10(var9 + 1)
	end, { var9 })
	reactModule.useEffect(function() --[[ line: 41 ]]
		-- upvalues: eventHandlerModule (copy), platform (ref), var9 (ref), var15 (ref)
		eventHandlerModule.StartEvents(platform, var9, var15)
		
		return function() --[[ line: 44 ]]
			-- upvalues: eventHandlerModule (copy), platform (copy), var9 (copy)
			eventHandlerModule.StopEvents(platform, var9)
		end
	end, { var9 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0)
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.05, 0) }),
		SlideshowLayout = reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0.05, 0),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Header = reactModule.createElement(headerModule, { platform = platform }),
		ContentFrame = reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, CONTENT_HEIGHT_RATIO, 0),
			Position = UDim2.new(0, 0, 0, 0)
		}, {
			Content = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(var14, 0, 1, 0),
				Position = UDim2.new(var13, 0, 0, 0)
			}, {
				ContentLayout = reactModule.createElement("UIListLayout", {
					Padding = UDim.new(0.05, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Title = reactModule.createElement(titleModule, { platform = platform, currentIndex = var9 }),
				Description = reactModule.createElement(descriptionModule, { platform = platform, currentIndex = var9 }),
				ImageFrame = reactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(1.2, 0, 0.4, 0),
					Position = UDim2.new(0, 0, 0, 0)
				}, {
					Image = reactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Image = var12.image,
						Size = UDim2.new(1, 0, 1, 0),
						ScaleType = Enum.ScaleType.Fit
					})
				})
			})
		}),
		FooterFrame = reactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, FOOTER_HEIGHT_RATIO, 0),
			Position = UDim2.new(0, 0, 0, 0)
		}, {
			Footer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(var14, 0, 1, 0),
				Position = UDim2.new(var13, 0, 0, 0)
			}, {
				ContentLayout = reactModule.createElement("UIListLayout", {
					Padding = var9 ~= #var11 and UDim.new(0.2, 0) or UDim.new(0, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Stepper = reactModule.createElement(stepperModule, {
					layoutOrder = 1,
					numberActivated = var9,
					numberOfSteps = #var11
				}, {}),
				EndItem = reactModule.createElement(endItemModule, {
					platform = platform,
					currentIndex = var9,
					increaseCurrentIndex = var15
				})
			})
		})
	})
end