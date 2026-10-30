local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local SizingModule = require(script.Parent.Sizing)
local HeaderItemModule = require(script.Parent.HeaderItem)
local MessageListViewModule = require(script.Parent.MessageListView)
local ObservingUserContextModule = require(script.Parent.ObservingUserContext)
local UseMessageListViewModelModule = require(script.Parent.useMessageListViewModel)

local function MessageListContent(p1)
	-- upvalues: UseMessageListViewModelModule (copy), ReactModule (copy), ObservingUserContextModule (copy), SizingModule (copy), HeaderItemModule (copy), FoundationModule (copy), ResponsiveModule (copy), MessageListViewModule (copy)
	local UseMessageListViewModelModuleResult = UseMessageListViewModelModule(p1)
	
	return ReactModule.createElement(ObservingUserContextModule.Context.Provider, {
		value = if p1.observingUserId == "" then nil else p1.observingUserId
	}, {
		Sizing = ReactModule.createElement(SizingModule.Context.Provider, { value = UseMessageListViewModelModuleResult.sizing }, {
			Header = ReactModule.createElement(HeaderItemModule.Context.Provider, { value = p1.header }, {
				Frame = ReactModule.createElement(FoundationModule.View, { Size = UDim2.fromScale(1, 1) }, {
					ResponsiveContainer = ReactModule.createElement(ResponsiveModule.ResponsiveContainerFrame),
					MessageListView = if UseMessageListViewModelModuleResult.isMeasured then ReactModule.createElement(MessageListViewModule, {
						listProps = UseMessageListViewModelModuleResult.listProps
					}) else nil
				})
			})
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), ResponsiveModule (copy), MessageListContent (copy)
	return ReactModule.createElement(ResponsiveModule.ResponsiveProvider, nil, {
		Content = ReactModule.createElement(MessageListContent, p1)
	})
end)