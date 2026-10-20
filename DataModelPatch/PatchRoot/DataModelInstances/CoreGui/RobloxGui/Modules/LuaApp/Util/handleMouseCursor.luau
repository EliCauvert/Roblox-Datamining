local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local SignalsModule = require(CorePackages.Packages.Signals)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local InputModeStore = ResponsiveModule.GetInputModeStore(false)
local Input = ResponsiveModule.Input

function handleMouseCursor()
	-- upvalues: InputModeStore (copy), SignalsModule (copy), Input (copy), UserInputService (copy)
	local GetLastInputTypeFunction = InputModeStore.getLastInputType
	
	return SignalsModule.createEffect(function(p1)
		-- upvalues: GetLastInputTypeFunction (copy), Input (upval), UserInputService (upval)
		local LastInputType = GetLastInputTypeFunction(p1)
		
		if LastInputType == Input.Pointer then
			UserInputService.MouseIconEnabled = true
			
			return
		end
		if LastInputType == Input.Touch or LastInputType == Input.Directional then
			UserInputService.MouseIconEnabled = false
		end
	end)
end

return handleMouseCursor