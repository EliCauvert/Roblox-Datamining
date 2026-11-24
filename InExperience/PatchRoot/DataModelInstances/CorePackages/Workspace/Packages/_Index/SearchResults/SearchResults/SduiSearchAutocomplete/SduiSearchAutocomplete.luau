local Parent = script:FindFirstAncestor("SearchResults").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local RoactGamepadModule = require(Parent.RoactGamepad)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local UseUiStatusFunction = SduiSharedUtilitiesModule.useUiStatus
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSearchAutocompleteConfigKeyModule = require(script.Parent.getSearchAutocompleteConfigKey)
local GetTopmostFocusableDescendantModule = require(script.Parent.getTopmostFocusableDescendant)
local SearchAutocompleteSurfaceModule = require(script.Parent.SearchAutocompleteSurface)
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(p1, p2, p3, p4)
	return if p2 == "" then "" elseif p1 == "" or p3 == "Error" or p3 == "Resolved" and not p4 then p2 else p1
end

return ReactModule.memo(ReactModule.forwardRef(function(Frame, Callback)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), GetSearchAutocompleteConfigKeyModule (copy), UseUiStatusFunction (copy), GetSduiApiStoreFunction (copy), SignalsReactModule (copy), GetTopmostFocusableDescendantModule (copy), RoactGamepadModule (copy), SduiFeatureEntryPoint (copy), SearchAutocompleteSurfaceModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(nil)
	local SearchAutocompleteConfigKeyModule = GetSearchAutocompleteConfigKeyModule(Frame.prefix)
	local UseUiStatusResult = UseUiStatusFunction(SearchAutocompleteConfigKeyModule)
	SignalsReactModule.useSignalState((ReactModule.useCallback(function(p1)
		-- upvalues: GetSduiApiStoreFunction (upval), SearchAutocompleteConfigKeyModule (copy)
		local Data, Data2 = GetSduiApiStoreFunction().getData(SearchAutocompleteConfigKeyModule)
		Data.data(p1)
		Data.status(p1)
		
		return Data2
	end, { SearchAutocompleteConfigKeyModule })))
	local _, Data2 = GetSduiApiStoreFunction().getData(SearchAutocompleteConfigKeyModule)
	local UseRefResult1 = ReactModule.useRef("")
	local Current = UseRefResult1.current
	local Prefix = Frame.prefix
	UseRefResult1.current = if Prefix == "" then "" elseif Current == "" or UseUiStatusResult == "Error" or UseUiStatusResult == "Resolved" and not Data2 then Prefix else Current
	local Current1 = UseRefResult1.current
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), GetTopmostFocusableDescendantModule (upval), Frame (copy), UseRefResult (copy), Callback (copy), UseStateResult2_2 (copy)
		if UseStateResult == nil then return end
		local t = {}
		local Current = nil
		local NextSelectionUp = nil
		local Flag = false
		local Flag1 = false
		
		local function _()
			-- upvalues: Current (ref), NextSelectionUp (ref)
			if Current then
				Current.NextSelectionUp = NextSelectionUp
				Current = nil
				NextSelectionUp = nil
			end
		end
		
		local function updateFocusable()
			-- upvalues: Flag (ref), GetTopmostFocusableDescendantModule (upval), UseStateResult (upval), Current (ref), NextSelectionUp (ref), Frame (upval), UseRefResult (upval), Callback (upval)
			Flag = false
			local TopmostFocusableDescendantModule = GetTopmostFocusableDescendantModule(UseStateResult)
			
			if Current ~= TopmostFocusableDescendantModule then
				if Current then
					Current.NextSelectionUp = NextSelectionUp
					Current = nil
					NextSelectionUp = nil
				end
				if TopmostFocusableDescendantModule then
					Current = TopmostFocusableDescendantModule
					NextSelectionUp = TopmostFocusableDescendantModule.NextSelectionUp
				end
			end
			if TopmostFocusableDescendantModule then
				TopmostFocusableDescendantModule.NextSelectionUp = if Frame.nextSelectionUp then Frame.nextSelectionUp.current else nil
			end
			UseRefResult.current = TopmostFocusableDescendantModule
			
			if typeof(Callback) == "function" then
				Callback(TopmostFocusableDescendantModule)
				
				return
			end
			if typeof(Callback) == "table" then
				Callback.current = TopmostFocusableDescendantModule
			end
		end
		
		local function requestUpdate()
			-- upvalues: Flag (ref), Flag1 (ref), updateFocusable (copy)
			if not Flag then
				Flag = true
				task.defer(function()
					-- upvalues: Flag1 (upval), Flag (upval), updateFocusable (upval)
					if not Flag1 and Flag then
						updateFocusable()
					end
				end)
				
				return
			end
		end
		
		local function trackRow(Object)
			-- upvalues: t (copy), requestUpdate (copy)
			if Object:IsA("GuiObject") and not t[Object] then
				t[Object] = {
					Object.AncestryChanged:Connect(requestUpdate),
					Object:GetPropertyChangedSignal("Selectable"):Connect(requestUpdate),
					Object:GetPropertyChangedSignal("Visible"):Connect(requestUpdate),
					Object:GetPropertyChangedSignal("AbsolutePosition"):Connect(requestUpdate)
				}
				
				return
			end
		end
		
		local _ = function(Key)
			-- upvalues: t (copy)
			local Entry = t[Key]
			
			if Entry then
				for _, Connection in Entry do
					Connection:Disconnect()
				end
				t[Key] = nil
			end
		end
		
		local function updateContentHeight()
			-- upvalues: UseStateResult2_2 (upval), UseStateResult (upval)
			UseStateResult2_2(UseStateResult.AbsoluteSize.Y)
		end
		
		for _, descendant in UseStateResult:GetDescendants() do
			trackRow(descendant)
		end
		updateFocusable()
		UseStateResult2_2(UseStateResult.AbsoluteSize.Y)
		local DescendantAddedConnection = UseStateResult.DescendantAdded:Connect(function(Descendant)
			-- upvalues: trackRow (copy), Flag (ref), Flag1 (ref), updateFocusable (copy)
			trackRow(Descendant)
			
			if not Flag then
				Flag = true
				task.defer(function()
					-- upvalues: Flag1 (upval), Flag (upval), updateFocusable (upval)
					if not Flag1 and Flag then
						updateFocusable()
					end
				end)
				
				return
			end
		end)
		local DescendantRemovingConnection = UseStateResult.DescendantRemoving:Connect(function(Descendant)
			-- upvalues: t (copy), Flag (ref), Flag1 (ref), updateFocusable (copy)
			local Entry = t[Descendant]
			
			if Entry then
				for _, Connection in Entry do
					Connection:Disconnect()
				end
				t[Descendant] = nil
			end
			if not Flag then
				Flag = true
				task.defer(function()
					-- upvalues: Flag1 (upval), Flag (upval), updateFocusable (upval)
					if not Flag1 and Flag then
						updateFocusable()
					end
				end)
				
				return
			end
		end)
		local Connection = UseStateResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateContentHeight)
		
		return function()
			-- upvalues: Flag1 (ref), DescendantAddedConnection (copy), DescendantRemovingConnection (copy), Connection (copy), t (copy), Current (ref), NextSelectionUp (ref), UseRefResult (upval), Callback (upval)
			Flag1 = true
			DescendantAddedConnection:Disconnect()
			DescendantRemovingConnection:Disconnect()
			Connection:Disconnect()
			
			for i in t do
				local Entry = t[i]
				
				if Entry then
					for _, Connection1 in Entry do
						Connection1:Disconnect()
					end
					t[i] = nil
				end
			end
			if Current then
				Current.NextSelectionUp = NextSelectionUp
				Current = nil
				NextSelectionUp = nil
			end
			UseRefResult.current = nil
			
			if typeof(Callback) == "function" then
				Callback(nil)
				
				return
			end
			if typeof(Callback) == "table" then
				Callback.current = nil
			end
		end
	end, { UseStateResult, Callback, Frame.nextSelectionUp })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), Frame (copy)
		if UseStateResult1 == nil or Frame.onAbsoluteSizeChange == nil then return end
		local function reportSize()
			-- upvalues: Frame (upval), UseStateResult1 (upval)
			Frame.onAbsoluteSizeChange(UseStateResult1)
		end
		
		Frame.onAbsoluteSizeChange(UseStateResult1)
		local Connection = UseStateResult1:GetPropertyChangedSignal("AbsoluteSize"):Connect(reportSize)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseStateResult1, Frame.onAbsoluteSizeChange })
	
	if Frame.prefix == "" then
		return nil
	else
		local XSmall = if UseStateResult3 > 0 then UseTokensResult.Padding.XSmall else 0
		local YOffset = UseStateResult3 + XSmall
		local Largest = math.max(0, (math.min(YOffset, Frame.maxHeight or YOffset)))
		
		return ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			SelectionGroup = true,
			LayoutOrder = Frame.LayoutOrder,
			Size = if Frame.Size then UDim2.new(Frame.Size.X.Scale, Frame.Size.X.Offset, 0, Largest) else UDim2.new(1, 0, 0, Largest),
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			defaultChild = UseRefResult,
			inputBindings = if Frame.onCancel then {
				CancelSearch = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, Frame.onCancel)
			} else nil,
			ref = UseStateResult2_1
		}, {
			Scroll = ReactModule.createElement("ScrollingFrame", {
				ScrollBarThickness = 0,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Selectable = false,
				ClipsDescendants = true,
				Size = UDim2.fromScale(1, 1),
				CanvasSize = UDim2.fromOffset(0, YOffset),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}, {
				Content = ReactModule.createElement(SduiFeatureEntryPoint, {
					shouldDisplayLoading = false,
					shouldDisplayError = false,
					appPage = SearchAutocompleteSurfaceModule,
					configKey = GetSearchAutocompleteConfigKeyModule(Current1),
					Position = UDim2.fromOffset(0, XSmall),
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					additionalAnalyticsData = { prefix = Current1 },
					ref = UseStateResult2
				})
			})
		})
	end
end))