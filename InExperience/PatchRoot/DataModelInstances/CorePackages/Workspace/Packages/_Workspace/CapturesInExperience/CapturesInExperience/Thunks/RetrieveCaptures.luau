local parent = script.Parent.Parent
local captureService = game:GetService("CaptureService")
local capturesRetrievedModule = require(parent.Actions.CapturesRetrieved)
local constantsModule = require(parent.Constants)
local _ = require(parent.Types)
local fetchCapturesFromGalleryModule = require(parent.Utils.fetchCapturesFromGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local fFlagCaptureServiceRetrieveCapturesSafeguardModule = require(parent.Flags.FFlagCaptureServiceRetrieveCapturesSafeguard)
local fFlagCapturesFetchUseSharedUtilityModule = require(parent.Flags.FFlagCapturesFetchUseSharedUtility)

local function _(p1)
	-- upvalues: constantsModule (ref)
	local selectedCaptureIndex = p1[constantsModule.RoduxKey].Carousel.SelectedCaptureIndex
	
	return if selectedCaptureIndex == nil then nil else p1[constantsModule.RoduxKey].Captures[selectedCaptureIndex]
end

return function()
	-- upvalues: constantsModule (ref), fFlagCapturesFetchUseSharedUtilityModule (ref), fetchCapturesFromGalleryModule (ref), capturesRetrievedModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureService (ref), fFlagCaptureServiceRetrieveCapturesSafeguardModule (ref)
	return function(p1)
		-- upvalues: constantsModule (copy), fFlagCapturesFetchUseSharedUtilityModule (copy), fetchCapturesFromGalleryModule (copy), capturesRetrievedModule (copy), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), captureService (copy), fFlagCaptureServiceRetrieveCapturesSafeguardModule (copy)
		local state = p1:getState()
		local selectedCaptureIndex = state[constantsModule.RoduxKey].Carousel.SelectedCaptureIndex
		local var1 = if selectedCaptureIndex ~= nil then nil else state[constantsModule.RoduxKey].Captures[selectedCaptureIndex]
		
		if fFlagCapturesFetchUseSharedUtilityModule then
			p1:dispatch(capturesRetrievedModule(fetchCapturesFromGalleryModule(), var1))
			
			return
		elseif fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			local ok, status = pcall(function()
				-- upvalues: captureService (copy)
				local var2, var3 = captureService:ReadCapturesFromGalleryAsync()
				
				return if var2 == Enum.ReadCapturesFromGalleryResult.Success then var3 else nil
			end)
			local t = {}
			
			if ok then
				for i, v in ipairs(status:GetCurrentPage()) do
					table.insert(t, v)
				end
				p1:dispatch(capturesRetrievedModule(t, var1))
				
				return
			else
				warn("Failed to retrieve captures from gallery")
				
				return
			end
		elseif not fFlagCaptureServiceRetrieveCapturesSafeguardModule then
			p1:dispatch(capturesRetrievedModule(captureService:RetrieveCaptures(), var1))
			
			return
		end
		local ok, status = pcall(function()
			-- upvalues: captureService (copy)
			return captureService:RetrieveCaptures()
		end)
		
		if ok then
			p1:dispatch(capturesRetrievedModule(status, var1))
			
			return
		end
		warn("Failed to retrieve captures from gallery")
	end
end