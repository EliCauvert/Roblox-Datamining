local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UseIsTvRemoteDeviceFunction = require(Parent.RoactUtils).Hooks.useIsTvRemoteDevice
local FFlagSplitPaneMicroGamepadPointerControls = require(Parent.SharedFlags).FFlagSplitPaneMicroGamepadPointerControls
local SplitPaneEducationalTourStepsModule = require(script.Parent.SplitPaneEducationalTourSteps)
local GetSplitPaneEducationalTourVideoAssetIdModule = require(script.Parent.getSplitPaneEducationalTourVideoAssetId)

local function getPreloadAssetIds(p1)
	-- upvalues: SplitPaneEducationalTourStepsModule (copy), GetSplitPaneEducationalTourVideoAssetIdModule (copy)
	local List = {}
	local t = {}
	
	local function _(Key)
		-- upvalues: t (copy), List (copy)
		if not t[Key] then
			t[Key] = true
			table.insert(List, Key)
		end
	end
	
	for i, value in SplitPaneEducationalTourStepsModule do
		local SplitPaneEducationalTourVideoAssetIdModule = GetSplitPaneEducationalTourVideoAssetIdModule(value, p1, false)
		
		if not t[SplitPaneEducationalTourVideoAssetIdModule] then
			t[SplitPaneEducationalTourVideoAssetIdModule] = true
			table.insert(List, SplitPaneEducationalTourVideoAssetIdModule)
		end
		if i == 1 then
			local SplitPaneEducationalTourVideoAssetIdModule1 = GetSplitPaneEducationalTourVideoAssetIdModule(value, p1, true)
			
			if not t[SplitPaneEducationalTourVideoAssetIdModule1] then
				t[SplitPaneEducationalTourVideoAssetIdModule1] = true
				table.insert(List, SplitPaneEducationalTourVideoAssetIdModule1)
			end
		end
	end
	return List
end

return function(p2, p3)
	-- upvalues: FFlagSplitPaneMicroGamepadPointerControls (copy), UseIsTvRemoteDeviceFunction (copy), ResponsiveModule (copy), ReactModule (copy), getPreloadAssetIds (copy)
	local UseIsTvRemoteDeviceResult = if FFlagSplitPaneMicroGamepadPointerControls then UseIsTvRemoteDeviceFunction() else false
	local NoUseIsTvRemoteDeviceResult: boolean = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional and not UseIsTvRemoteDeviceResult
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseRefResult (copy), p3 (copy), getPreloadAssetIds (upval), NoUseIsTvRemoteDeviceResult (copy)
		if p2 and not UseRefResult.current then
			UseRefResult.current = true
			local P3 = p3 or game:GetService("ContentProvider")
			local PreloadAssetIds = getPreloadAssetIds(NoUseIsTvRemoteDeviceResult)
			task.spawn(function()
				-- upvalues: P3 (copy), PreloadAssetIds (copy)
				pcall(function()
					-- upvalues: P3 (upval), PreloadAssetIds (upval)
					P3:PreloadAsync(PreloadAssetIds)
				end)
			end)
			
			return
		end
	end, { p2, NoUseIsTvRemoteDeviceResult, p3 })
end