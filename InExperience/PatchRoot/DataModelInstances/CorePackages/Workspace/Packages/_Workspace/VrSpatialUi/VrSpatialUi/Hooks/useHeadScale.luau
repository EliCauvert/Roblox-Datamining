local vrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local parent = vrSpatialUi.Parent
local reactModule = require(parent.React)
local UIManagerModule = require(vrSpatialUi.UIManager)
local inExperienceUIVRIXP = require(parent.SharedExperimentDefinition).InExperienceUIVRIXP

local function _(p1, p2)
	-- upvalues: UIManagerModule (ref)
	local additionalCameraScaleIfNeeded = UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded()
	
	if p1 and p1.current then
		p1.current.Size = Vector3.new(p2.X * additionalCameraScaleIfNeeded, p2.Y * additionalCameraScaleIfNeeded, p1.current.Size.Z)
	end
end

return function(p1, p2)
	-- upvalues: reactModule (ref), UIManagerModule (ref), inExperienceUIVRIXP (ref)
	local var1, var2 = reactModule.useState(function()
		-- upvalues: UIManagerModule (copy)
		return UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded()
	end)
	reactModule.useEffect(function()
		-- upvalues: inExperienceUIVRIXP (copy), p1 (ref), p2 (ref), UIManagerModule (copy), var2 (ref)
		if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then
			local var3 = p1
			local var4 = p2
			local additionalCameraScaleIfNeeded = UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded()
			
			if var3 and var3.current then
				var3.current.Size = Vector3.new(var4.X * additionalCameraScaleIfNeeded, var4.Y * additionalCameraScaleIfNeeded, var3.current.Size.Z)
			end
		else
			var2(UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded())
		end
		local var5 = workspace.CurrentCamera:GetPropertyChangedSignal("HeadScale"):Connect(function()
			-- upvalues: inExperienceUIVRIXP (copy), p1 (copy), p2 (copy), UIManagerModule (copy), var2 (copy)
			if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then
				local var6 = p1
				local var7 = p2
				local additionalCameraScaleIfNeeded = UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded()
				
				if var6 and var6.current then
					var6.current.Size = Vector3.new(var7.X * additionalCameraScaleIfNeeded, var7.Y * additionalCameraScaleIfNeeded, var6.current.Size.Z)
					
					return
				end
			else
				var2(UIManagerModule.getInstance():getAdditionalCameraScaleIfNeeded())
			end
		end)
		
		return function()
			-- upvalues: var5 (ref)
			var5:Disconnect()
		end
	end, if inExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then { p1, p2 } else {})
	
	return var1, var2
end