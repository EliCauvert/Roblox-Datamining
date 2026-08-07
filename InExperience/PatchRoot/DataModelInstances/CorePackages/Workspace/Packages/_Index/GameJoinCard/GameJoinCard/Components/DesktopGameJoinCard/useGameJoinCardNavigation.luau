local parent = script:FindFirstAncestor("GameJoinCard").Parent
local reactModule = require(parent.React)
local fFlagPPVEnabledOnConsole = require(parent.SharedFlags).FFlagPPVEnabledOnConsole
local fFlagEnableConsoleGameJoinCard = require(parent.SharedFlags).FFlagEnableConsoleGameJoinCard
local fFlagBlockEDPClickthrough = require(parent.SharedFlags).FFlagBlockEDPClickthrough

return function(p0, p1, p2) --[[ line: 9 | named "useGameJoinCardNavigation" ]]
	-- upvalues: reactModule (ref), fFlagPPVEnabledOnConsole (ref), fFlagEnableConsoleGameJoinCard (ref), fFlagBlockEDPClickthrough (ref)
	local var1, var2 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 12 ]]
		-- upvalues: p0 (ref), var2 (ref)
		if not p0 then
			var2(false)
			
			return
		end
		local guiService = game:GetService("GuiService")
		
		local function checkFocus() --[[ line: 18 ]]
			-- upvalues: guiService (ref), var2 (copy), p0 (copy)
			local selectedCoreObject = guiService.SelectedCoreObject
			var2(not (selectedCoreObject == nil or selectedCoreObject == p0) and (selectedCoreObject:IsDescendantOf(p0) and selectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil))
		end
		
		local selectedCoreObject = guiService.SelectedCoreObject
		var2(not (selectedCoreObject == nil or selectedCoreObject == p0) and (selectedCoreObject:IsDescendantOf(p0) and selectedCoreObject:FindFirstAncestorOfClass("CoreGui") ~= nil))
		local var5 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(checkFocus)
		
		return function() --[[ line: 28 ]]
			-- upvalues: var5 (ref)
			var5:Disconnect()
		end
	end, { p0 })
	reactModule.useEffect(function() --[[ line: 33 ]]
		-- upvalues: fFlagPPVEnabledOnConsole (copy), fFlagEnableConsoleGameJoinCard (copy), p1 (ref), p0 (ref), p2 (ref), fFlagBlockEDPClickthrough (copy)
		if not fFlagPPVEnabledOnConsole and not fFlagEnableConsoleGameJoinCard or not p1 then return end
		if not p0 then return end
		local current = p2.current
		
		if not current then return end
		local content = current:FindFirstChild("Content", true)
		
		if content then
			local function wireNavigation() --[[ line: 49 ]]
				-- upvalues: fFlagBlockEDPClickthrough (copy), p0 (copy), content (ref)
				if fFlagBlockEDPClickthrough then
					local platformName = p0:FindFirstChild("PlatformName", true)
					
					if platformName then
						content.NextSelectionDown = platformName
						platformName.NextSelectionUp = content
					end
					return
				else
					local thumbnail = p0:FindFirstChild("Thumbnail", true)
					local gameName = p0:FindFirstChild("GameName", true)
					local platformName = p0:FindFirstChild("PlatformName", true)
					
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
			local descendantAddedConnection = p0.DescendantAdded:Connect(wireNavigation)
			
			return function() --[[ line: 80 ]]
				-- upvalues: descendantAddedConnection (ref), content (ref), fFlagBlockEDPClickthrough (copy), p0 (copy)
				descendantAddedConnection:Disconnect()
				
				if content and content.Parent then
					content.NextSelectionDown = nil
				end
				if not fFlagBlockEDPClickthrough then
					local thumbnail = p0:FindFirstChild("Thumbnail", true)
					
					if thumbnail and thumbnail.Parent then
						thumbnail.NextSelectionUp = nil
					end
					local gameName = p0:FindFirstChild("GameName", true)
					
					if gameName and gameName.Parent then
						gameName.NextSelectionUp = nil
						gameName.NextSelectionDown = nil
					end
				end
				local platformName = p0:FindFirstChild("PlatformName", true)
				
				if platformName and platformName.Parent then
					platformName.NextSelectionUp = nil
					platformName.NextSelectionDown = nil
				end
			end
		end
	end, { p0, p1 })
	
	return var1
end