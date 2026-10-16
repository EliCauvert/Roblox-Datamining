local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local _ = require(Parent.Types)
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

local function findNewSelectedCaptureIndex(Captures, SelectedCaptureIndex, SelectedCapture) --[[ Line: 32 ]]
	-- upvalues: FFlagUseRbxstorageInGalleryModule (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CryoModule (copy), CaptureTypeModule (copy)
	return if FFlagUseRbxstorageInGalleryModule or Captures[SelectedCaptureIndex] == nil or Captures[SelectedCaptureIndex].filePath ~= SelectedCapture.filePath or FFlagEnableCapturesGalleryRetrievalCoreScriptModule then CryoModule.List.findWhere(Captures, function(p1): boolean --[[ Line: 47 ]]
		-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), SelectedCapture (copy), FFlagUseRbxstorageInGalleryModule (upval), CaptureTypeModule (upval)
		return if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then tostring(p1.CaptureTime.UnixTimestampMillis) == tostring(SelectedCapture.CaptureTime.UnixTimestampMillis) elseif FFlagUseRbxstorageInGalleryModule and p1.type == CaptureTypeModule.Video and SelectedCapture.type == CaptureTypeModule.Video then p1.thumbnailKey == SelectedCapture.thumbnailKey elseif FFlagUseRbxstorageInGalleryModule and p1.type == CaptureTypeModule.Screenshot and SelectedCapture.type == CaptureTypeModule.Screenshot then p1.filePath == SelectedCapture.filePath else not FFlagUseRbxstorageInGalleryModule and p1.filePath == SelectedCapture.filePath
	end) else SelectedCaptureIndex
end

return require(Parent1.Rodux).createReducer({
	IsOpen = false,
	IsDeleteWarningModalOpen = false,
	SelectedCaptureIndex = 0
}, {
	[require(Parent.Actions.CapturesRetrieved).name] = function(p1, p2) --[[ Line: 72 ]]
		-- upvalues: CryoModule (copy), findNewSelectedCaptureIndex (copy)
		if p1.IsOpen == false then
			return p1
		elseif #p2.captures == 0 then
			return CryoModule.Dictionary.join(p1, { IsOpen = false, SelectedCaptureIndex = 0 })
		elseif p2.selectedCapture == nil then
			return CryoModule.Dictionary.join(p1, {
				SelectedCaptureIndex = math.min(p1.SelectedCaptureIndex, #p2.captures)
			})
		else
			assert(p2.selectedCapture ~= nil, "CapturesRetrieved selectedCapture should not be nil")
			local NewSelectedCaptureIndex = findNewSelectedCaptureIndex(p2.captures, p1.SelectedCaptureIndex, p2.selectedCapture)
			
			return if NewSelectedCaptureIndex == p1.SelectedCaptureIndex then p1 elseif NewSelectedCaptureIndex == nil then CryoModule.Dictionary.join(p1, {
				SelectedCaptureIndex = math.clamp(p1.SelectedCaptureIndex - 1, 1, #p2.captures)
			}) else CryoModule.Dictionary.join(p1, { SelectedCaptureIndex = NewSelectedCaptureIndex })
		end
	end,
	[require(Parent.Actions.CarouselClosed).name] = function(p1, _) --[[ Line: 117 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { IsOpen = false, SelectedCaptureIndex = 0 })
	end,
	[require(Parent.Actions.CarouselIndexSelected).name] = function(p1, p2) --[[ Line: 124 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { SelectedCaptureIndex = p2.index })
	end,
	[require(Parent.Actions.CarouselOpened).name] = function(p1, p2) --[[ Line: 130 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { IsOpen = true, SelectedCaptureIndex = p2.index })
	end,
	[require(Parent.Actions.DeleteWarningModalClosed).name] = function(p1, _) --[[ Line: 137 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { IsDeleteWarningModalOpen = false })
	end,
	[require(Parent.Actions.DeleteWarningModalOpened).name] = function(p1, _) --[[ Line: 143 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { IsDeleteWarningModalOpen = true })
	end
})