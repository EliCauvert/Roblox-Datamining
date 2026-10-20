local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local GetDisplayStoreFunction = require(Parent.Display).GetDisplayStore
local GetInputModeStoreFunction = require(Parent.Responsive).GetInputModeStore
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.ConditionalProps.SduiConditionalPropTypes)
local CheckResponsiveConditionsFunction = require(SduiCoreSystem.SduiResponsiveHelpers).checkResponsiveConditions

return ReactModule.memo(function(p1)
	-- upvalues: GetDisplayStoreFunction (copy), GetInputModeStoreFunction (copy), ReactModule (copy), CheckResponsiveConditionsFunction (copy), SignalsModule (copy)
	local AllConditionalProps = p1.allConditionalProps
	local SetFailedResponsivePropIndexesFunction = p1.setFailedResponsivePropIndexes
	local SduiContext = p1.sduiContext
	local GetViewportSizeFunction = GetDisplayStoreFunction(false).getViewportSize
	local GetLastInputTypeFunction = GetInputModeStoreFunction(false).getLastInputType
	local GetPreferredInputTypeFunction = GetInputModeStoreFunction(false).getPreferredInputType
	local GetIsSpatialFunction = GetDisplayStoreFunction(false).getIsSpatial
	ReactModule.useLayoutEffect(function()
		-- upvalues: CheckResponsiveConditionsFunction (upval), AllConditionalProps (copy), SduiContext (copy), SetFailedResponsivePropIndexesFunction (copy), GetViewportSizeFunction (copy), GetLastInputTypeFunction (copy), GetPreferredInputTypeFunction (copy), GetIsSpatialFunction (copy), SignalsModule (upval)
		local t = {}
		
		local function checkConditions(p2, p3, p4, p5)
			-- upvalues: CheckResponsiveConditionsFunction (upval), AllConditionalProps (upval), SduiContext (upval), t (ref), SetFailedResponsivePropIndexesFunction (upval)
			local CheckResponsiveConditionsResult = CheckResponsiveConditionsFunction(AllConditionalProps, p2, p3, p4, p5, SduiContext)
			local Flag: boolean? = nil
			
			for i, value in CheckResponsiveConditionsResult do
				if not not t[i] ~= not not value then
					Flag = true
					break
				end
			end
			if not Flag then
				for i1, value1 in t do
					if not not CheckResponsiveConditionsResult[i1] ~= not not value1 then
						Flag = true
						break
					end
				end
			end
			if Flag then
				t = CheckResponsiveConditionsResult
				SetFailedResponsivePropIndexesFunction(CheckResponsiveConditionsResult)
			end
		end
		
		checkConditions(GetViewportSizeFunction(false), GetLastInputTypeFunction(false), GetPreferredInputTypeFunction(false), GetIsSpatialFunction(false))
		
		return SignalsModule.createEffect(function(p6)
			-- upvalues: checkConditions (copy), GetViewportSizeFunction (upval), GetLastInputTypeFunction (upval), GetPreferredInputTypeFunction (upval), GetIsSpatialFunction (upval)
			checkConditions(GetViewportSizeFunction(p6), GetLastInputTypeFunction(p6), GetPreferredInputTypeFunction(p6), GetIsSpatialFunction(p6))
		end)
	end, {
		GetViewportSizeFunction, GetLastInputTypeFunction,
		GetPreferredInputTypeFunction, GetIsSpatialFunction, AllConditionalProps,
		SetFailedResponsivePropIndexesFunction, SduiContext
	})
	
	return nil
end)