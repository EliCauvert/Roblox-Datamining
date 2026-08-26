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

local function findNewSelectedCaptureIndex(p1, p2, p3)
	-- upvalues: fFlagUseRbxstorageInGalleryModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), cryoModule (ref), captureTypeModule (ref)
	return if fFlagUseRbxstorageInGalleryModule or p1[p2] == nil or (p1[p2].filePath ~= p3.filePath or fFlagEnableCapturesGalleryRetrievalCoreScriptModule) then cryoModule.List.findWhere(p1, function(p4)
		-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), p3 (ref), fFlagUseRbxstorageInGalleryModule (copy), captureTypeModule (copy)
		return if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then tostring(p4.CaptureTime.UnixTimestampMillis) == tostring(p3.CaptureTime.UnixTimestampMillis) elseif fFlagUseRbxstorageInGalleryModule and p4.type == captureTypeModule.Video and p3.type == captureTypeModule.Video then p4.thumbnailKey == p3.thumbnailKey elseif fFlagUseRbxstorageInGalleryModule and p4.type == captureTypeModule.Screenshot and p3.type == captureTypeModule.Screenshot then p4.filePath == p3.filePath elseif fFlagUseRbxstorageInGalleryModule then false else p4.filePath == p3.filePath
	end) else p2
end

return roduxModule.createReducer({
	IsOpen = false,
	IsDeleteWarningModalOpen = false,
	SelectedCaptureIndex = 0
}, {
	[capturesRetrievedModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref), findNewSelectedCaptureIndex (ref)
		if p1.IsOpen == false then
			return p1
		elseif #p2.captures == 0 then
			return cryoModule.Dictionary.join(p1, { IsOpen = false, SelectedCaptureIndex = 0 })
		elseif p2.selectedCapture == nil then
			return cryoModule.Dictionary.join(p1, {
				SelectedCaptureIndex = math.min(p1.SelectedCaptureIndex, #p2.captures)
			})
		end
		assert(p2.selectedCapture ~= nil, "CapturesRetrieved selectedCapture should not be nil")
		local var1 = findNewSelectedCaptureIndex(p2.captures, p1.SelectedCaptureIndex, p2.selectedCapture)
		
		return if var1 == p1.SelectedCaptureIndex then p1 elseif var1 == nil then cryoModule.Dictionary.join(p1, {
			SelectedCaptureIndex = math.clamp(p1.SelectedCaptureIndex - 1, 1, #p2.captures)
		}) else cryoModule.Dictionary.join(p1, { SelectedCaptureIndex = var1 })
	end,
	[carouselClosedModule.name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { IsOpen = false, SelectedCaptureIndex = 0 })
	end,
	[carouselIndexSelectedModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { SelectedCaptureIndex = p2.index })
	end,
	[carouselOpenedModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { IsOpen = true, SelectedCaptureIndex = p2.index })
	end,
	[deleteWarningModalClosedModule.name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { IsDeleteWarningModalOpen = false })
	end,
	[deleteWarningModalOpenedModule.name] = function(p1, _)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { IsDeleteWarningModalOpen = true })
	end
})