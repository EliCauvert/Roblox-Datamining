local SavedQualityFollowerModule = {}
SavedQualityFollowerModule.__index = SavedQualityFollowerModule

function SavedQualityFollowerModule.new(_enabler, _slider)
	-- upvalues: SavedQualityFollowerModule (copy)
	return (setmetatable({
		_isShowing = false,
		_showCount = 0,
		_enabler = _enabler,
		_slider = _slider
	}, SavedQualityFollowerModule))
end

function SavedQualityFollowerModule:isShowing()
	return self._isShowing
end

function SavedQualityFollowerModule:show(SavedQualitySetting)
	local IsSavedQualitySettingMatch = SavedQualitySetting == Enum.SavedQualitySetting.Automatic
	local SelectedIndex: number = if IsSavedQualitySettingMatch then 1 else 2
	local IsNotSelectedIndexMatch = self._enabler:GetSelectedIndex() ~= SelectedIndex
	local IsNotValueMatch: boolean = not IsSavedQualitySettingMatch and self._slider:GetValue() ~= SavedQualitySetting.Value
	
	if not IsNotSelectedIndexMatch and not IsNotValueMatch then return end
	self._isShowing = true
	self._showCount += 1
	local ShowCount = self._showCount
	
	if IsNotSelectedIndexMatch then
		self._enabler:SetSelectionIndex(SelectedIndex)
	end
	if IsNotValueMatch then
		self._slider:SetValue(SavedQualitySetting.Value)
	end
	task.defer(function()
		-- upvalues: self (copy), ShowCount (copy)
		if self._showCount == ShowCount then
			self._isShowing = false
		end
	end)
end

return SavedQualityFollowerModule