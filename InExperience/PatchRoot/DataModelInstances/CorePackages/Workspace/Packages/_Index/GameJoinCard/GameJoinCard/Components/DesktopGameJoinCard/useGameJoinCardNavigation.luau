local parent = script:FindFirstAncestor("GameJoinCard").Parent
local reactModule = require(parent.React)
local fFlagPPVEnabledOnConsole = require(parent.SharedFlags).FFlagPPVEnabledOnConsole
local fFlagEnableConsoleGameJoinCard = require(parent.SharedFlags).FFlagEnableConsoleGameJoinCard
local fFlagBlockEDPClickthrough = require(parent.SharedFlags).FFlagBlockEDPClickthrough

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), fFlagPPVEnabledOnConsole (ref), fFlagEnableConsoleGameJoinCard (ref), fFlagBlockEDPClickthrough (ref)
	local var1, var2 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		if not p1 then
			var2(false)
			
			return
		end
		local guiService = game:GetService("GuiService")
		
		local function checkFocus()
			-- upvalues: guiService (ref), var2 (copy), p1 (copy)
			local selectedCoreObject = guiService.SelectedCoreObject
			var2(not (selectedCoreObject == nil or selectedCoreObject == p1) and (selectedCoreObject:IsDescendantOf(p1) and selectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil))
		end
		
		local selectedCoreObject = guiService.SelectedCoreObject
		var2(not (selectedCoreObject == nil or selectedCoreObject == p1) and (selectedCoreObject:IsDescendantOf(p1) and selectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil))
		local var3 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(checkFocus)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: fFlagPPVEnabledOnConsole (copy), fFlagEnableConsoleGameJoinCard (copy), p2 (ref), p1 (ref), p3 (ref), fFlagBlockEDPClickthrough (copy)
		if not fFlagPPVEnabledOnConsole and not fFlagEnableConsoleGameJoinCard or not p2 then return end
		if not p1 then return end
		local current = p3.current
		
		if not current then return end
		local content = current:FindFirstChild("Content", true)
		
		if content then
			local function wireNavigation()
				-- upvalues: fFlagBlockEDPClickthrough (copy), p1 (copy), content (ref)
				if fFlagBlockEDPClickthrough then
					local platformName = p1:FindFirstChild("PlatformName", true)
					
					if platformName then
						content.NextSelectionDown = platformName
						platformName.NextSelectionUp = content
					end
					return
				else
					local thumbnail = p1:FindFirstChild("Thumbnail", true)
					local gameName = p1:FindFirstChild("GameName", true)
					local platformName = p1:FindFirstChild("PlatformName", true)
					
					if thumbnail then
						content.NextSelectionDown = thumbnail
						thumbnail.NextSelectionUp = content
					end
					if gameName then
						gameName.NextSelectionUp = content
					end
					if platformName then
						platformName.NextSelectionUp = gameName or content
						
						if gameName then
							gameName.NextSelectionDown = platformName
						end
					end
				end
			end
			
			wireNavigation()
			local descendantAddedConnection = p1.DescendantAdded:Connect(wireNavigation)
			
			return function()
				-- upvalues: descendantAddedConnection (ref), content (ref), fFlagBlockEDPClickthrough (copy), p1 (copy)
				descendantAddedConnection:Disconnect()
				
				if content and content.Parent then
					content.NextSelectionDown = nil
				end
				if not fFlagBlockEDPClickthrough then
					local thumbnail = p1:FindFirstChild("Thumbnail", true)
					
					if thumbnail and thumbnail.Parent then
						thumbnail.NextSelectionUp = nil
					end
					local gameName = p1:FindFirstChild("GameName", true)
					
					if gameName and gameName.Parent then
						gameName.NextSelectionUp = nil
						gameName.NextSelectionDown = nil
					end
				end
				local platformName = p1:FindFirstChild("PlatformName", true)
				
				if platformName and platformName.Parent then
					platformName.NextSelectionUp = nil
					platformName.NextSelectionDown = nil
				end
			end
		end
	end, { p1, p2 })
	
	return var1
end