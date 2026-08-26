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

return function(p1)
	-- upvalues: reactModule (ref), FTUXSlideshowDataModule (ref), FTUXConstantsModule (ref), eventHandlerModule (ref), headerModule (ref), titleModule (ref), descriptionModule (ref), stepperModule (ref), endItemModule (ref)
	local var1, var2 = reactModule.useState(1)
	local platform = p1.platform
	local var3 = FTUXSlideshowDataModule[platform]
	local panelConstants = FTUXConstantsModule[platform].PanelConstants
	local var4 = var3[var1]
	local CONTENT_HEIGHT_RATIO = panelConstants.CONTENT_HEIGHT_RATIO
	local FOOTER_HEIGHT_RATIO = panelConstants.FOOTER_HEIGHT_RATIO
	local var5 = panelConstants.CONTENT_PADDING / panelConstants.SLIDESHOW_FRAME_WIDTH
	local var6 = 1 - 2 * var5
	local var7 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var1 (ref)
		var2(var1 + 1)
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: eventHandlerModule (copy), platform (ref), var1 (ref), var7 (ref)
		eventHandlerModule.StartEvents(platform, var1, var7)
		
		return function()
			-- upvalues: eventHandlerModule (copy), platform (copy), var1 (copy)
			eventHandlerModule.StopEvents(platform, var1)
		end
	end, { var1 })
	
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
				Size = UDim2.new(var6, 0, 1, 0),
				Position = UDim2.new(var5, 0, 0, 0)
			}, {
				ContentLayout = reactModule.createElement("UIListLayout", {
					Padding = UDim.new(0.05, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Title = reactModule.createElement(titleModule, { platform = platform, currentIndex = var1 }),
				Description = reactModule.createElement(descriptionModule, { platform = platform, currentIndex = var1 }),
				ImageFrame = reactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(1.2, 0, 0.4, 0),
					Position = UDim2.new(0, 0, 0, 0)
				}, {
					Image = reactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Image = var4.image,
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
				Size = UDim2.new(var6, 0, 1, 0),
				Position = UDim2.new(var5, 0, 0, 0)
			}, {
				ContentLayout = reactModule.createElement("UIListLayout", {
					Padding = var1 ~= #var3 and UDim.new(0.2, 0) or UDim.new(0, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Stepper = reactModule.createElement(stepperModule, {
					layoutOrder = 1,
					numberActivated = var1,
					numberOfSteps = #var3
				}, {}),
				EndItem = reactModule.createElement(endItemModule, {
					platform = platform,
					currentIndex = var1,
					increaseCurrentIndex = var7
				})
			})
		})
	})
end