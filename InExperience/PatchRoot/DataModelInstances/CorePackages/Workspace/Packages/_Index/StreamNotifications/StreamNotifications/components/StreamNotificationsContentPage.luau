local StreamNotifications = script:FindFirstAncestor("StreamNotifications")
local Parent = StreamNotifications.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local ContentPageConstantsModule = require(StreamNotifications.ContentPage.ContentPageConstants)
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local UsePageScopeRefFunction = SduiSharedUtilitiesModule.usePageScopeRef
local ConfigKey = ContentPageConstantsModule.ConfigKey

return function(Frame)
	-- upvalues: UsePageScopeRefFunction (copy), ConfigKey (copy), SignalsReactModule (copy), GetSduiApiStoreFunction (copy), ContentPageConstantsModule (copy), ReactModule (copy), SduiFeatureEntryPoint (copy)
	UsePageScopeRefFunction(ConfigKey)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetSduiApiStoreFunction().getData(ConfigKey).data)
	local List = {}
	
	if UseSignalStateResult then
		for _, value in UseSignalStateResult do
			if value.identifier and value.identifier ~= "" and value.identifier ~= ContentPageConstantsModule.FeedEntryIdentifier and value.config then
				table.insert(List, value)
			end
		end
	end
	table.sort(List, function(A, B): boolean
		return A.identifier < B.identifier
	end)
	local Elements = {}
	
	for LayoutOrder, value1 in List do
		Elements[value1.identifier] = ReactModule.createElement(SduiFeatureEntryPoint, {
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			configKey = ConfigKey,
			identifier = value1.identifier,
			appPage = ConfigKey,
			LayoutOrder = LayoutOrder
		})
	end
	if #List > 0 then
		Elements.UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = Frame.LayoutOrder,
			Position = Frame.Position
		}, Elements)
	else
		return nil
	end
end