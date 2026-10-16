local Parent = script.Parent.Parent
local CaptureService = game:GetService("CaptureService")
local CapturesRetrievedModule = require(Parent.Actions.CapturesRetrieved)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.Types)
local FetchCapturesFromGalleryModule = require(Parent.Utils.fetchCapturesFromGallery)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local FFlagCaptureServiceRetrieveCapturesSafeguardModule = require(Parent.Flags.FFlagCaptureServiceRetrieveCapturesSafeguard)
local FFlagCapturesFetchUseSharedUtilityModule = require(Parent.Flags.FFlagCapturesFetchUseSharedUtility)

local function _(p1) --[[ Line: 16 | Named "getSelectedCapture" ]]
	-- upvalues: ConstantsModule (copy)
	local SelectedCaptureIndex = p1[ConstantsModule.RoduxKey].Carousel.SelectedCaptureIndex
	
	return if SelectedCaptureIndex == nil then nil else p1[ConstantsModule.RoduxKey].Captures[SelectedCaptureIndex]
end

return function() --[[ Line: 25 ]]
	-- upvalues: ConstantsModule (copy), FFlagCapturesFetchUseSharedUtilityModule (copy), FetchCapturesFromGalleryModule (copy), CapturesRetrievedModule (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureService (copy), FFlagCaptureServiceRetrieveCapturesSafeguardModule (copy)
	return function(p1) --[[ Line: 26 ]]
		-- upvalues: ConstantsModule (upval), FFlagCapturesFetchUseSharedUtilityModule (upval), FetchCapturesFromGalleryModule (upval), CapturesRetrievedModule (upval), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), CaptureService (upval), FFlagCaptureServiceRetrieveCapturesSafeguardModule (upval)
		local State = p1:getState()
		local SelectedCaptureIndex = State[ConstantsModule.RoduxKey].Carousel.SelectedCaptureIndex
		local Capture = if SelectedCaptureIndex == nil then nil else State[ConstantsModule.RoduxKey].Captures[SelectedCaptureIndex]
		
		if FFlagCapturesFetchUseSharedUtilityModule then
			p1:dispatch(CapturesRetrievedModule(FetchCapturesFromGalleryModule(), Capture))
			
			return
		end
		if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			local Success, Result = pcall(function() --[[ Line: 34 ]]
				-- upvalues: CaptureService (upval)
				local CapturesFromGalleryAsync, CapturesFromGalleryAsync2 = CaptureService:ReadCapturesFromGalleryAsync()
				
				return if CapturesFromGalleryAsync == Enum.ReadCapturesFromGalleryResult.Success then CapturesFromGalleryAsync2 else nil
			end)
			local List = {}
			
			if not Success then
				warn("Failed to retrieve captures from gallery")
				
				return
			end
			for _, value in ipairs((Result:GetCurrentPage())) do
				table.insert(List, value)
			end
			p1:dispatch(CapturesRetrievedModule(List, Capture))
			
			return
		elseif not FFlagCaptureServiceRetrieveCapturesSafeguardModule then
			p1:dispatch(CapturesRetrievedModule(CaptureService:RetrieveCaptures(), Capture))
			
			return
		else
			local Success1, Result1 = pcall(function() --[[ Line: 54 ]]
				-- upvalues: CaptureService (upval)
				return CaptureService:RetrieveCaptures()
			end)
			
			if Success1 then
				p1:dispatch(CapturesRetrievedModule(Result1, Capture))
				
				return
			else
				warn("Failed to retrieve captures from gallery")
			end
		end
	end
end