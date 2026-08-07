local parent = script.Parent.Parent
local dEV = require(parent.ReactGlobals).__DEV__
local _ = require(script.Parent.ReactInternalTypes)
local reactSharedInternals = require(parent.Shared).ReactSharedInternals
local getStackByFiberInDevAndProd = require(script.Parent.ReactFiberComponentStack).getStackByFiberInDevAndProd
local getComponentName = require(parent.Shared).getComponentName
local reactDebugCurrentFrame = reactSharedInternals.ReactDebugCurrentFrame
local t = { current = nil, isRendering = false }

function t.getCurrentFiberOwnerNameInDevOrNull() --[[ line: 39 ]]
	-- upvalues: dEV (ref), t (ref), getComponentName (ref)
	if dEV then
		if t.current == nil then
			return nil
		end
		local debugOwner = t.current._debugOwner
		
		return if debugOwner then getComponentName(debugOwner.type) else nil
	end
end

local function getCurrentFiberStackInDev() --[[ line: 53 ]]
	-- upvalues: dEV (ref), t (ref), getStackByFiberInDevAndProd (ref)
	return if dEV then if t.current == nil then "" else getStackByFiberInDevAndProd(t.current) else ""
end

function t.resetCurrentFiber() --[[ line: 66 ]]
	-- upvalues: dEV (ref), reactDebugCurrentFrame (ref), t (ref)
	if dEV then
		reactDebugCurrentFrame.getCurrentStack = nil
		t.current = nil
		t.isRendering = false
	end
end

function t.setCurrentFiber(p0) --[[ line: 75 ]]
	-- upvalues: dEV (ref), reactDebugCurrentFrame (ref), getCurrentFiberStackInDev (ref), t (ref)
	if dEV then
		reactDebugCurrentFrame.getCurrentStack = getCurrentFiberStackInDev
		t.current = p0
		t.isRendering = false
	end
end

function t.setIsRendering(p1) --[[ line: 84 ]]
	-- upvalues: dEV (ref), t (ref)
	if dEV then
		t.isRendering = p1
	end
end

function t.getIsRendering() --[[ line: 90 ]]
	-- upvalues: dEV (ref), t (ref)
	return if dEV then t.isRendering else false
end

return t