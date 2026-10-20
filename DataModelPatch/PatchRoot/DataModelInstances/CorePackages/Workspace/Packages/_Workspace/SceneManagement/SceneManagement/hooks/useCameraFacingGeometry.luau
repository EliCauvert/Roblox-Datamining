local ReactModule = require(script:FindFirstAncestor("SceneManagement").Parent.React)

function getCameraFacingCFrame(p1, CF): CFrame
	return CFrame.lookAt(CF.Position + p1 * CF.LookVector, CF.Position, CF.UpVector)
end

function getDimensionsToFillViewPort(p1: number, Camera: Camera): Vector2
	local ScaledTangent = p1 * 2 * math.tan((math.rad(Camera.FieldOfView / 2)))
	
	return Vector2.new(ScaledTangent * (if Camera.ViewportSize.Y > 0 then Camera.ViewportSize.X / Camera.ViewportSize.Y else 0), ScaledTangent)
end

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(workspace.CurrentCamera)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new())
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(CFrame.new())
	
	local function _(p2)
		-- upvalues: UseBindingResult2 (copy), p1 (copy), UseBindingResult2_1 (copy)
		UseBindingResult2(getDimensionsToFillViewPort(p1, p2))
		UseBindingResult2_1(getCameraFacingCFrame(p1, p2.CFrame))
	end
	
	local function makeCameraPropConnections(Object)
		-- upvalues: UseBindingResult2 (copy), p1 (copy), UseBindingResult2_1 (copy)
		local List = {}
		
		for _, PropertyName in { "CFrame", "ViewportSize", "FieldOfView" } do
			table.insert(List, Object:GetPropertyChangedSignal(PropertyName):Connect(function()
				-- upvalues: Object (copy), UseBindingResult2 (upval), p1 (upval), UseBindingResult2_1 (upval)
				UseBindingResult2(getDimensionsToFillViewPort(p1, Object))
				UseBindingResult2_1(getCameraFacingCFrame(p1, Object.CFrame))
			end))
		end
		return List
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		local Connection = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(workspace.CurrentCamera)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), makeCameraPropConnections (copy), UseBindingResult2 (copy), p1 (copy), UseBindingResult2_1 (copy)
		local Connections = nil
		
		if UseStateResult then
			Connections = makeCameraPropConnections(UseStateResult)
			UseBindingResult2(getDimensionsToFillViewPort(p1, UseStateResult))
			UseBindingResult2_1(getCameraFacingCFrame(p1, UseStateResult.CFrame))
		end
		return function()
			-- upvalues: Connections (ref)
			if Connections then
				for _, connection in Connections do
					connection:Disconnect()
				end
			end
		end
	end, { UseStateResult })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseBindingResult (copy), UseBindingResult1 (copy)
		return {
			viewportFillDimensions = UseBindingResult,
			cFrame = UseBindingResult1
		}
	end, {})
end