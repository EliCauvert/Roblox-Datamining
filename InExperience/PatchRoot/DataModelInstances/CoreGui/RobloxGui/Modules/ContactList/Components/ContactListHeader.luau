local reactModule = require(game:GetService("CorePackages").Packages.React)
local contactList = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList
local dependenciesModule = require(contactList.dependencies)
local pagesModule = require(contactList.Enums.Pages)
local setCurrentPageModule = require(contactList.Actions.SetCurrentPage)
local useAnalyticsModule = require(contactList.Analytics.useAnalytics)
local eventNamesEnumModule = require(contactList.Analytics.EventNamesEnum)
local useDispatch = dependenciesModule.Hooks.useDispatch
local useLocalization = dependenciesModule.Hooks.useLocalization
local UIBlox = dependenciesModule.UIBlox
local images = UIBlox.App.ImageSet.Images
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local useStyle = UIBlox.Core.Style.useStyle

local _ = function(p0) --[[ line: 33 ]]
	-- upvalues: pagesModule (ref)
	return if p0 == pagesModule.FriendList then "Feature.Call.Label.StartNewCall" elseif p0 == pagesModule.CallHistory then "Feature.Call.Label.RecentCalls" else ""
end

return function(p1) --[[ line: 42 ]]
	-- upvalues: useAnalyticsModule (ref), useStyle (ref), useDispatch (ref), useLocalization (ref), pagesModule (ref), reactModule (ref), eventNamesEnumModule (ref), setCurrentPageModule (ref), imageSetButton (ref), images (ref)
	local var6 = useAnalyticsModule()
	local var7 = useStyle()
	local var8 = useDispatch()
	local theme = var7.Theme
	local font = var7.Font
	local t = {}
	local currentPage = p1.currentPage
	t.titleLabel = if currentPage == pagesModule.FriendList then "Feature.Call.Label.StartNewCall" elseif currentPage == pagesModule.CallHistory then "Feature.Call.Label.RecentCalls" else ""
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, p1.headerHeight),
		LayoutOrder = p1.layoutOrder
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24)
		}),
		HeaderUIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		DismissButton = reactModule.createElement(imageSetButton, {
			Size = UDim2.fromOffset(32, 32),
			BackgroundColor3 = theme.BackgroundDefault.Color,
			BackgroundTransparency = theme.BackgroundDefault.Transparency,
			Image = if p1.currentPage == pagesModule.CallHistory then images["icons/navigation/close"] else images["icons/navigation/pushBack"],
			LayoutOrder = 1,
			[reactModule.Event.Activated] = if p1.currentPage == pagesModule.CallHistory then p1.dismissCallback else reactModule.useCallback(function() --[[ line: 53 ]]
				-- upvalues: var6 (ref), eventNamesEnumModule (copy), p1 (ref), pagesModule (copy), var8 (ref), setCurrentPageModule (copy)
				var6.fireEvent(eventNamesEnumModule.PhoneBookNavigate, {
					eventTimestampMs = os.time() * 1000,
					startingPage = p1.currentPage,
					destinationPage = pagesModule.CallHistory
				})
				var8(setCurrentPageModule(pagesModule.CallHistory))
			end, { p1.currentPage })
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		}),
		DividerContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Divider = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 1, 0, 16),
				BackgroundColor3 = theme.Divider.Color,
				BackgroundTransparency = theme.Divider.Transparency
			}),
			DividerContainerUIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 12)
			})
		}),
		HeaderText = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, -85, 0, 24),
			Font = font.Header1.Font,
			Text = useLocalization(t).titleLabel,
			TextColor3 = theme.TextEmphasis.Color,
			TextSize = font.Header1.RelativeSize * font.BaseSize,
			TextTransparency = theme.TextEmphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		NewCallButton = if p1.currentPage == pagesModule.CallHistory then reactModule.createElement(imageSetButton, {
			Size = UDim2.fromOffset(32, 32),
			BackgroundColor3 = theme.BackgroundDefault.Color,
			BackgroundTransparency = theme.BackgroundDefault.Transparency,
			Image = "rbxassetid://15239778003",
			LayoutOrder = 4,
			[reactModule.Event.Activated] = reactModule.useCallback(function() --[[ line: 62 ]]
				-- upvalues: var6 (ref), eventNamesEnumModule (copy), p1 (ref), pagesModule (copy), var8 (ref), setCurrentPageModule (copy)
				var6.fireEvent(eventNamesEnumModule.PhoneBookNavigate, {
					eventTimestampMs = os.time() * 1000,
					startingPage = p1.currentPage,
					destinationPage = pagesModule.FriendList
				})
				var8(setCurrentPageModule(pagesModule.FriendList))
			end, { p1.currentPage })
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		}) else nil
	})
end