local UIScaleOptionsModule = {
	get = function(p1)
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy)
			return p1:GetUIScaleOptions()
		end)
		
		return if Success then Result else nil
	end,
	optionId = function(p1, p2): string
		return `{p1}:{p2}`
	end,
	valueFromOption = function(Text: string, p1)
		local Match, Match2 = string.match(Text, "^(%d+):(%d+)$")
		local Number: number? = tonumber(Match)
		local Number1: number? = tonumber(Match2)
		
		return if Number and p1.enabled[Number] and p1.values[Number] == Number1 then Number1 else nil
	end,
	equal = function(p1, p2): boolean
		if p1.savedHundredths ~= p2.savedHundredths or p1.autoHundredths ~= p2.autoHundredths or p1.selectedIndex ~= p2.selectedIndex or p1.defaultIndex ~= p2.defaultIndex or #p1.values ~= #p2.values then
			return false
		end
		for i, value in p1.values do
			if value ~= p2.values[i] or p1.enabled[i] ~= p2.enabled[i] then
				return false
			end
		end
		return true
	end,
	valueForMode = function(p3, IsNotSavedHundredthsMatch)
		if IsNotSavedHundredthsMatch == (p3.savedHundredths ~= 0) then
			return nil
		elseif IsNotSavedHundredthsMatch then
			local Value: number = p3.values[p3.defaultIndex]
			
			return if Value and Value > 0 then Value else nil
		else
			return 0
		end
	end
}

function UIScaleOptionsModule.valueFromSlider(SelectedIndex, p3, p4, p5)
	-- upvalues: UIScaleOptionsModule (copy)
	return if p5.savedHundredths == 0 or SelectedIndex ~= p3 or not p5.enabled[SelectedIndex] or not UIScaleOptionsModule.equal(p4, p5) or SelectedIndex == p5.selectedIndex then nil else p5.values[SelectedIndex]
end

return UIScaleOptionsModule