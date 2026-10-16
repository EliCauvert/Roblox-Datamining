local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local ReactModule = require(Parent.React)
local FFlagBlockEDPClickthrough = require(Parent.SharedFlags).FFlagBlockEDPClickthrough

return function(Object, p1, p2) --[[ Line: 7 | Named "useGameJoinCardNavigation" ]]
	-- upvalues: ReactModule (copy), FFlagBlockEDPClickthrough (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: Object (copy), UseStateResult2 (copy)
		if not Object then
			UseStateResult2(false)
			
			return
		end
		local GuiService = game:GetService("GuiService")
		
		local function checkFocus() --[[ Line: 16 ]]
			-- upvalues: GuiService (copy), UseStateResult2 (upval), Object (upval)
			local SelectedCoreObject = GuiService.SelectedCoreObject
			UseStateResult2(SelectedCoreObject ~= nil and (if SelectedCoreObject == Object then SelectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil else SelectedCoreObject:IsDescendantOf(Object) and SelectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil))
		end
		
		local SelectedCoreObject = GuiService.SelectedCoreObject
		UseStateResult2(SelectedCoreObject ~= nil and (if SelectedCoreObject == Object then SelectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil else SelectedCoreObject:IsDescendantOf(Object) and SelectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil))
		local Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(checkFocus)
		
		return function() --[[ Line: 26 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { Object })
	ReactModule.useEffect(function() --[[ Line: 31 ]]
		-- upvalues: p1 (copy), Object (copy), p2 (copy), FFlagBlockEDPClickthrough (upval)
		if not p1 then return end
		if not Object then return end
		local Current = p2.current
		
		if not Current then return end
		local Content = Current:FindFirstChild("Content", true)
		
		if not Content then return end
		local function wireNavigation() --[[ Line: 47 ]]
			-- upvalues: FFlagBlockEDPClickthrough (upval), Object (upval), Content (copy)
			if FFlagBlockEDPClickthrough then
				local PlatformName = Object:FindFirstChild("PlatformName", true)
				
				if PlatformName then
					Content.NextSelectionDown = PlatformName
					PlatformName.NextSelectionUp = Content
				end
				return
			else
				local Thumbnail = Object:FindFirstChild("Thumbnail", true)
				local GameName = Object:FindFirstChild("GameName", true)
				local PlatformName1 = Object:FindFirstChild("PlatformName", true)
				
				if Thumbnail then
					Content.NextSelectionDown = Thumbnail
					Thumbnail.NextSelectionUp = Content
				end
				if GameName then
					GameName.NextSelectionUp = Content
				end
				if PlatformName1 then
					PlatformName1.NextSelectionUp = if GameName then GameName else Content
					
					if GameName then
						GameName.NextSelectionDown = PlatformName1
					end
				end
			end
		end
		
		wireNavigation()
		local DescendantAddedConnection = Object.DescendantAdded:Connect(wireNavigation)
		
		return function() --[[ Line: 78 ]]
			-- upvalues: DescendantAddedConnection (copy), Content (copy), FFlagBlockEDPClickthrough (upval), Object (upval)
			DescendantAddedConnection:Disconnect()
			
			if Content and Content.Parent then
				Content.NextSelectionDown = nil
			end
			if not FFlagBlockEDPClickthrough then
				local Thumbnail = Object:FindFirstChild("Thumbnail", true)
				
				if Thumbnail and Thumbnail.Parent then
					Thumbnail.NextSelectionUp = nil
				end
				local GameName = Object:FindFirstChild("GameName", true)
				
				if GameName and GameName.Parent then
					GameName.NextSelectionUp = nil
					GameName.NextSelectionDown = nil
				end
			end
			local PlatformName = Object:FindFirstChild("PlatformName", true)
			
			if PlatformName and PlatformName.Parent then
				PlatformName.NextSelectionUp = nil
				PlatformName.NextSelectionDown = nil
			end
		end
	end, { Object, p1 })
	
	return UseStateResult
end