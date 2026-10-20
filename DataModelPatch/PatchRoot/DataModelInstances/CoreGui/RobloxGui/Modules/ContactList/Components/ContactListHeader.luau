local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ContactList = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList
local DependenciesModule = require(ContactList.dependencies)
local PagesModule = require(ContactList.Enums.Pages)
local SetCurrentPageModule = require(ContactList.Actions.SetCurrentPage)
local UseAnalyticsModule = require(ContactList.Analytics.useAnalytics)
local EventNamesEnumModule = require(ContactList.Analytics.EventNamesEnum)
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UIBlox = DependenciesModule.UIBlox
local Images = UIBlox.App.ImageSet.Images
local ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local UseStyleFunction = UIBlox.Core.Style.useStyle

local function _(CallHistory): string
	-- upvalues: PagesModule (copy)
	return if CallHistory == PagesModule.FriendList then "Feature.Call.Label.StartNewCall" elseif CallHistory == PagesModule.CallHistory then "Feature.Call.Label.RecentCalls" else ""
end

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), PagesModule (copy), ReactModule (copy), EventNamesEnumModule (copy), SetCurrentPageModule (copy), ImageSetButton (copy), Images (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseStyleResult = UseStyleFunction()
	local UseDispatchResult = UseDispatchFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local CurrentPage = p1.currentPage
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval), p1 (copy), PagesModule (upval), UseDispatchResult (copy), SetCurrentPageModule (upval)
		UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookNavigate, {
			eventTimestampMs = os.time() * 1000,
			startingPage = p1.currentPage,
			destinationPage = PagesModule.CallHistory
		})
		UseDispatchResult(SetCurrentPageModule(PagesModule.CallHistory))
	end, { p1.currentPage })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval), p1 (copy), PagesModule (upval), UseDispatchResult (copy), SetCurrentPageModule (upval)
		UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookNavigate, {
			eventTimestampMs = os.time() * 1000,
			startingPage = p1.currentPage,
			destinationPage = PagesModule.FriendList
		})
		UseDispatchResult(SetCurrentPageModule(PagesModule.FriendList))
	end, { p1.currentPage })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, p1.headerHeight),
		LayoutOrder = p1.layoutOrder
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24)
		}),
		HeaderUIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		DismissButton = ReactModule.createElement(ImageSetButton, {
			Size = UDim2.fromOffset(32, 32),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			Image = if p1.currentPage == PagesModule.CallHistory then Images["icons/navigation/close"] else Images["icons/navigation/pushBack"],
			LayoutOrder = 1,
			[ReactModule.Event.Activated] = if p1.currentPage == PagesModule.CallHistory then p1.dismissCallback else UseResult
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		}),
		DividerContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Divider = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 1, 0, 16),
				BackgroundColor3 = Theme.Divider.Color,
				BackgroundTransparency = Theme.Divider.Transparency
			}),
			DividerContainerUIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 12)
			})
		}),
		HeaderText = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, -85, 0, 24),
			Font = UseStyleResultFont.Header1.Font,
			Text = UseLocalizationFunction({
				titleLabel = if CurrentPage == PagesModule.FriendList then "Feature.Call.Label.StartNewCall" elseif CurrentPage == PagesModule.CallHistory then "Feature.Call.Label.RecentCalls" else ""
			}).titleLabel,
			TextColor3 = Theme.TextEmphasis.Color,
			TextSize = UseStyleResultFont.Header1.RelativeSize * UseStyleResultFont.BaseSize,
			TextTransparency = Theme.TextEmphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		NewCallButton = if p1.currentPage == PagesModule.CallHistory then ReactModule.createElement(ImageSetButton, {
			Size = UDim2.fromOffset(32, 32),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			Image = "rbxassetid://15239778003",
			LayoutOrder = 4,
			[ReactModule.Event.Activated] = UseResult1
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		}) else nil
	})
end