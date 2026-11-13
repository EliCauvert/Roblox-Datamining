local AmbientModule = require("./ambient")
local FreezeModule = require("./freeze")
local Joined = table.concat({
	"Gamepad and keyboard contention with the legacy player scripts:",
	"1. The legacy control scripts bind gamepad ButtonA to jumpAction through ContextActionService at priority 2000 and consume it, so a selected control never receives ButtonA. In a UI-only place, disableLegacyControls() turns the controls off (or unbinds jumpAction). A game with an avatar must not do this.",
	"2. The fix for a game is Workspace.PlayerScriptsUseInputActionSystem, which is REQUIRED by Facet: it moves the player scripts, camera included, onto the Input Action System. It is NOT scriptable, but a Rojo project file CAN declare it.",
	"3. GuiService.CoreGuiNavigationEnabled turns itself back on when a script turns it off; do not rely on it.",
	"4. Tab opens the CoreGui players list while that list is enabled, so Facet's Tab traversal does not receive it. StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false) frees it. traversalKeyContended() reports it.",
	"5. ContextActionService priority and InputContext.Priority are NOT one arbitration space: a sinking ContextActionService binding takes a key before any InputContext at any priority. The camera's RbxCameraKeypress holds Left and Right that way. A BindActionAtPriority claim is not Facet's route. THE FIX IS TRUTH 2, NOT A NUMBER.",
	"6. cameraKeysContended() reports whether any ContextActionService binding holds an arrow key. It reads a different binding than legacyStackActive(), and one can be true while the other is false."
}, "\n")
local config = {
	["Enum.KeyCode.Left"] = true,
	["Enum.KeyCode.Right"] = true,
	["Enum.KeyCode.Up"] = true,
	["Enum.KeyCode.Down"] = true
}
local ChildNames = { "CharacterContext", "CameraContext", "VehicleContext" }

local function _()
	-- upvalues: AmbientModule (copy)
	return assert(AmbientModule(), "no game here")
end

local function boundActions()
	-- upvalues: AmbientModule (copy)
	return assert(AmbientModule(), "no game here"):GetService("ContextActionService"):GetAllBoundActionInfo()
end

local config1 = {
	describeContention = function()
		-- upvalues: Joined (copy)
		return Joined
	end,
	legacyStackActive = function(): boolean
		-- upvalues: AmbientModule (copy)
		local Success, Result = pcall(function(): boolean
			-- upvalues: AmbientModule (upval)
			return assert(AmbientModule(), "no game here"):GetService("ContextActionService"):GetAllBoundActionInfo().jumpAction ~= nil
		end)
		
		return Success and Result == true
	end,
	iasPlayerScriptsActive = function(p1, p2): boolean
		-- upvalues: AmbientModule (copy), ChildNames (copy)
		local Success, Result = pcall(function(): boolean
			-- upvalues: p1 (copy), AmbientModule (upval), p2 (copy), ChildNames (upval)
			local Object = assert(p1 or assert(AmbientModule(), "no game here"):GetService("Players").LocalPlayer)
			local InputContexts = Object:FindFirstChild("InputContexts") or Object:WaitForChild("InputContexts", p2 or 1)
			
			if InputContexts == nil then
				return false
			end
			for _, childName in ChildNames do
				local Child = InputContexts:FindFirstChild(childName)
				
				if Child ~= nil and Child.ClassName == "InputContext" then
					return true
				end
			end
			return false
		end)
		
		return Success and Result == true
	end,
	cameraKeysContended = function(p3): boolean
		-- upvalues: boundActions (copy), config (copy)
		local v1 = p3
		
		if v1 == nil then
			local Success, Result = pcall(boundActions)
			
			if not Success then
				return false
			end
			v1 = Result
		end
		for _, value in assert(v1) do
			local InputTypes = value.inputTypes or {}
			for _, inputType in InputTypes do
				if config[tostring(inputType)] then
					return true
				end
			end
		end
		return false
	end,
	traversalKeyContended = function(): boolean
		-- upvalues: AmbientModule (copy)
		local Success, Result = pcall(function()
			-- upvalues: AmbientModule (upval)
			return assert(AmbientModule(), "no game here"):GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList)
		end)
		
		return Success and Result == true
	end,
	freedJumpAction = function(AllBoundActionInfo, p4): boolean
		return AllBoundActionInfo.jumpAction ~= nil and p4.jumpAction == nil
	end
}

function config1.disableLegacyControls(p4, p5)
	-- upvalues: config1 (copy), AmbientModule (copy), boundActions (copy)
	if config1.iasPlayerScriptsActive(p5) then
		return true, "inert: IAS owns PlayerScripts"
	elseif pcall(function()
		-- upvalues: p4 (copy), AmbientModule (upval)
		local NoPlayerModule = assert((p4 or assert(assert(AmbientModule(), "no game here"):GetService("Players").LocalPlayer:WaitForChild("PlayerScripts", 5), "no PlayerScripts")):WaitForChild("PlayerModule", 5), "no PlayerModule")
		assert(NoPlayerModule:IsA("ModuleScript"))
		require(NoPlayerModule):GetControls():Disable()
	end) then
		return true, "disabled"
	else
		local Success, Result = pcall(function()
			-- upvalues: AmbientModule (upval), config1 (upval), boundActions (upval)
			local AllBoundActionInfo = assert(AmbientModule(), "no game here"):GetService("ContextActionService"):GetAllBoundActionInfo()
			
			if AllBoundActionInfo.jumpAction == nil then
				return false
			else
				assert(AmbientModule(), "no game here"):GetService("ContextActionService"):UnbindAction("jumpAction")
				
				return config1.freedJumpAction(AllBoundActionInfo, boundActions())
			end
		end)
		
		if Success and Result then
			return true, "unbound"
		else
			return false, "unavailable"
		end
	end
end

return FreezeModule(config1)