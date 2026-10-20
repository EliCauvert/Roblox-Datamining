local ReactModule = require(game:GetService("CorePackages").Packages.React)
local Parent = script.Parent.Parent
local FTUXSlideshowDataModule = require(Parent.Resources.FTUXSlideshowData)
local FTUXConstantsModule = require(Parent.Resources.FTUXConstants)
local _ = require(Parent.Enums.PlatformEnum)
local HeaderModule = require(Parent.Components.Slideshow.Header)
local StepperModule = require(Parent.Components.Slideshow.Stepper)
local TitleModule = require(Parent.Components.Slideshow.Title)
local DescriptionModule = require(Parent.Components.Slideshow.Description)
local EndItemModule = require(Parent.Components.Slideshow.EndItem)
local EventHandlerModule = require(Parent.Events.EventHandler)

return function(p1)
	-- upvalues: ReactModule (copy), FTUXSlideshowDataModule (copy), FTUXConstantsModule (copy), EventHandlerModule (copy), HeaderModule (copy), TitleModule (copy), DescriptionModule (copy), StepperModule (copy), EndItemModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(1)
	local Platform = p1.platform
	local FTUXSlideshowDataModuleEntry = FTUXSlideshowDataModule[Platform]
	local PanelConstants = FTUXConstantsModule[Platform].PanelConstants
	local FTUXSlideshowDataModuleEntry1 = FTUXSlideshowDataModuleEntry[UseStateResult]
	local CONTENTHEIGHTRATIO = PanelConstants.CONTENT_HEIGHT_RATIO
	local FOOTERHEIGHTRATIO = PanelConstants.FOOTER_HEIGHT_RATIO
	local CONTENTPADDINGRatio = PanelConstants.CONTENT_PADDING / PanelConstants.SLIDESHOW_FRAME_WIDTH
	local XScale = 1 - 2 * CONTENTPADDINGRatio
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
		UseStateResult2(UseStateResult + 1)
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: EventHandlerModule (upval), Platform (copy), UseStateResult (copy), UseResult (copy)
		EventHandlerModule.StartEvents(Platform, UseStateResult, UseResult)
		
		return function()
			-- upvalues: EventHandlerModule (upval), Platform (upval), UseStateResult (upval)
			EventHandlerModule.StopEvents(Platform, UseStateResult)
		end
	end, { UseStateResult })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0)
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.05, 0) }),
		SlideshowLayout = ReactModule.createElement("UIListLayout", {
			Padding = UDim.new(0.05, 0),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Header = ReactModule.createElement(HeaderModule, { platform = Platform }),
		ContentFrame = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, CONTENTHEIGHTRATIO, 0),
			Position = UDim2.new(0, 0, 0, 0)
		}, {
			Content = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(XScale, 0, 1, 0),
				Position = UDim2.new(CONTENTPADDINGRatio, 0, 0, 0)
			}, {
				ContentLayout = ReactModule.createElement("UIListLayout", {
					Padding = UDim.new(0.05, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Title = ReactModule.createElement(TitleModule, { platform = Platform, currentIndex = UseStateResult }),
				Description = ReactModule.createElement(DescriptionModule, { platform = Platform, currentIndex = UseStateResult }),
				ImageFrame = ReactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(1.2, 0, 0.4, 0),
					Position = UDim2.new(0, 0, 0, 0)
				}, {
					Image = ReactModule.createElement("ImageLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Image = FTUXSlideshowDataModuleEntry1.image,
						Size = UDim2.new(1, 0, 1, 0),
						ScaleType = Enum.ScaleType.Fit
					})
				})
			})
		}),
		FooterFrame = ReactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, FOOTERHEIGHTRATIO, 0),
			Position = UDim2.new(0, 0, 0, 0)
		}, {
			Footer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(XScale, 0, 1, 0),
				Position = UDim2.new(CONTENTPADDINGRatio, 0, 0, 0)
			}, {
				ContentLayout = ReactModule.createElement("UIListLayout", {
					Padding = if UseStateResult == #FTUXSlideshowDataModuleEntry then UDim.new(0, 0) else UDim.new(0.2, 0) or UDim.new(0, 0),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Stepper = ReactModule.createElement(StepperModule, {
					layoutOrder = 1,
					numberActivated = UseStateResult,
					numberOfSteps = #FTUXSlideshowDataModuleEntry
				}, {}),
				EndItem = ReactModule.createElement(EndItemModule, {
					platform = Platform,
					currentIndex = UseStateResult,
					increaseCurrentIndex = UseResult
				})
			})
		})
	})
end