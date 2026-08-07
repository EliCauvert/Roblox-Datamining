local parent = script.Parent.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local roduxModule = require(parent_1.Rodux)
local capturesRetrievedModule = require(parent.Actions.CapturesRetrieved)
local captureTypeModule = require(parent.Enums.CaptureType)
local carouselClosedModule = require(parent.Actions.CarouselClosed)
local carouselIndexSelectedModule = require(parent.Actions.CarouselIndexSelected)
local carouselOpenedModule = require(parent.Actions.CarouselOpened)
local deleteWarningModalClosedModule = require(parent.Actions.DeleteWarningModalClosed)
local deleteWarningModalOpenedModule = require(parent.Actions.DeleteWarningModalOpened)
local _ = require(parent.Types)
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

local function findNewSelectedCaptureIndex(p0, p1, p2) --[[ line: 32 ]]
	-- upvalues: fFlagUseRbxstorageInGalleryModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), cryoModule (ref), captureTypeModule (ref)
	return if fFlagUseRbxstorageInGalleryModule or p0[p1] == nil or (p0[p1].filePath ~= p2.filePath or fFlagEnableCapturesGalleryRetrievalCoreScriptModule) then cryoModule.List.findWhere(p0, function(p3) --[[ line: 47 ]]
		-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), p2 (ref), fFlagUseRbxstorageInGalleryModule (copy), captureTypeModule (copy)
		return if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then tostring(p3.CaptureTime.UnixTimestampMillis) == tostring(p2.CaptureTime.UnixTimestampMillis) elseif fFlagUseRbxstorageInGalleryModule and p3.type == captureTypeModule.Video and p2.type == captureTypeModule.Video then p3.thumbnailKey == p2.thumbnailKey elseif fFlagUseRbxstorageInGalleryModule and p3.type == captureTypeModule.Screenshot and p2.type == captureTypeModule.Screenshot then p3.filePath == p2.filePath elseif fFlagUseRbxstorageInGalleryModule then false else p3.filePath == p2.filePath
	end) else p1
end

return roduxModule.createReducer({
	IsOpen = false,
	IsDeleteWarningModalOpen = false,
	SelectedCaptureIndex = 0
}, {
	[capturesRetrievedModule.name] = function(p4, p5) --[[ line: 72 ]]
		-- upvalues: cryoModule (ref), findNewSelectedCaptureIndex (ref)
		if p4.IsOpen == false then
			return p4
		elseif #p5.captures == 0 then
			return cryoModule.Dictionary.join(p4, { IsOpen = false, SelectedCaptureIndex = 0 })
		elseif p5.selectedCapture == nil then
			return cryoModule.Dictionary.join(p4, {
				SelectedCaptureIndex = math.min(p4.SelectedCaptureIndex, #p5.captures)
			})
		end
		assert(p5.selectedCapture ~= nil, "CapturesRetrieved selectedCapture should not be nil")
		local var12 = findNewSelectedCaptureIndex(p5.captures, p4.SelectedCaptureIndex, p5.selectedCapture)
		
		return if var12 == p4.SelectedCaptureIndex then p4 elseif var12 == nil then cryoModule.Dictionary.join(p4, {
			SelectedCaptureIndex = math.clamp(p4.SelectedCaptureIndex - 1, 1, #p5.captures)
		}) else cryoModule.Dictionary.join(p4, { SelectedCaptureIndex = var12 })
	end,
	[carouselClosedModule.name] = function(p6, _) --[[ line: 117 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p6, { IsOpen = false, SelectedCaptureIndex = 0 })
	end,
	[carouselIndexSelectedModule.name] = function(p7, p8) --[[ line: 124 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p7, { SelectedCaptureIndex = p8.index })
	end,
	[carouselOpenedModule.name] = function(p9, p10) --[[ line: 130 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p9, { IsOpen = true, SelectedCaptureIndex = p10.index })
	end,
	[deleteWarningModalClosedModule.name] = function(p11, _) --[[ line: 137 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p11, { IsDeleteWarningModalOpen = false })
	end,
	[deleteWarningModalOpenedModule.name] = function(p12, _) --[[ line: 143 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p12, { IsDeleteWarningModalOpen = true })
	end
})