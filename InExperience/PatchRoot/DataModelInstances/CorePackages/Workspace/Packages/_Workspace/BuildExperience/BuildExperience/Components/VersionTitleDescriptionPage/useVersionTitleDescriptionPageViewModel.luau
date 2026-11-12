local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local PlaceVersionHistoryModule = require(Parent.DataHydration.PlaceVersionHistory)
local GetVersionInformationStoreModule = require(BuildExperience.Stores.GetVersionInformationStore)
local _ = require(script.Parent.VersionTitleDescriptionPageView)
local DataStatus = require(Parent.DataHydration).DataStatus

return function(p1)
	-- upvalues: GetVersionInformationStoreModule (copy), PlaceVersionHistoryModule (copy), ReactModule (copy), SignalsReactModule (copy), DataStatus (copy)
	local VersionInformationStoreModule = GetVersionInformationStoreModule()
	local PlaceVersionHistoryStore = PlaceVersionHistoryModule.getPlaceVersionHistoryStore()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PlaceVersionHistoryStore (copy), p1 (copy)
		return PlaceVersionHistoryStore.fetchHistory(p1.placeId)
	end, { p1.placeId, PlaceVersionHistoryStore })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.status)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(VersionInformationStoreModule.getDraft)
	local UseSignalStateResult3 = if UseSignalStateResult2 == nil or UseSignalStateResult2.placeId ~= p1.placeId then nil else UseSignalStateResult2
	local PlaceVersion = if UseSignalStateResult == nil then nil else UseSignalStateResult.placeVersions[1]
	local Title = if PlaceVersion == nil then nil else PlaceVersion.title
	local Description = if PlaceVersion == nil then nil else PlaceVersion.description
	local Title1 = if UseSignalStateResult3 == nil then Title or "" else UseSignalStateResult3.title
	local Description1 = if UseSignalStateResult3 == nil then Description or "" else UseSignalStateResult3.description
	local IsUseSignalStateResultMatch: boolean = UseSignalStateResult1 == DataStatus.Ready or UseSignalStateResult1 == DataStatus.Failed
	local HasUseSignalStateResult: boolean = UseSignalStateResult3 ~= nil or IsUseSignalStateResultMatch
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding("")
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding("")
	local UseRefResult = ReactModule.useRef("")
	local UseRefResult1 = ReactModule.useRef("")
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: HasUseSignalStateResult (copy), UseBindingResult (copy), UseRefResult (copy), UseBindingResult1 (copy), UseRefResult1 (copy), UseStateResult (copy), p1 (copy), Title1 (copy), Description1 (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy), UseStateResult2 (copy)
		if not HasUseSignalStateResult then return end
		local IsNotValueMatch: boolean = UseBindingResult:getValue() ~= UseRefResult.current or UseBindingResult1:getValue() ~= UseRefResult1.current
		
		if UseStateResult ~= p1.placeId or not IsNotValueMatch then
			UseRefResult.current = Title1
			UseRefResult1.current = Description1
			UseBindingResult2(Title1)
			UseBindingResult2_1(Description1)
			UseStateResult2(p1.placeId)
			
			return
		end
	end, {
		UseBindingResult1, Description1, Title1, UseStateResult,
		HasUseSignalStateResult, p1.placeId, UseBindingResult
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), p1 (copy), UseBindingResult (copy), UseBindingResult1 (copy), UseRefResult (copy), UseRefResult1 (copy), VersionInformationStoreModule (copy)
		if UseStateResult ~= p1.placeId then return end
		local Value = UseBindingResult:getValue()
		local Value1 = UseBindingResult1:getValue()
		
		if Value ~= UseRefResult.current or Value1 ~= UseRefResult1.current then
			VersionInformationStoreModule.setDraft(p1.placeId, Value, Value1)
			UseRefResult.current = Value
			UseRefResult1.current = Value1
			
			return
		end
	end, {
		UseBindingResult1,
		UseStateResult,
		p1.placeId,
		UseBindingResult,
		VersionInformationStoreModule
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		return UseResult
	end, { UseResult })
	
	return {
		isReady = UseStateResult == p1.placeId,
		onBack = ReactModule.useCallback(function()
			-- upvalues: UseResult (copy), p1 (copy)
			UseResult()
			p1.onBack()
		end, { p1.onBack, UseResult }),
		onDescriptionChanged = UseBindingResult2_1,
		onFocusLost = UseResult,
		onTitleChanged = UseBindingResult2,
		titleText = UseBindingResult,
		descriptionText = UseBindingResult1,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end