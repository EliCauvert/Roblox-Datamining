local Parent = script.Parent.Parent
local DEV = require(Parent.ReactGlobals).__DEV__
local _ = require(script.Parent.ReactInternalTypes)
local GetStackByFiberInDevAndProdFunction = require(script.Parent.ReactFiberComponentStack).getStackByFiberInDevAndProd
local GetComponentNameFunction = require(Parent.Shared).getComponentName
local ReactDebugCurrentFrame = require(Parent.Shared).ReactSharedInternals.ReactDebugCurrentFrame
local ReactCurrentFiberModule = { current = nil, isRendering = false }

function ReactCurrentFiberModule.getCurrentFiberOwnerNameInDevOrNull()
	-- upvalues: DEV (copy), ReactCurrentFiberModule (copy), GetComponentNameFunction (copy)
	if DEV then
		if ReactCurrentFiberModule.current == nil then
			return nil
		end
		local DebugOwner = ReactCurrentFiberModule.current._debugOwner
		
		if DebugOwner then
			return GetComponentNameFunction(DebugOwner.type)
		end
	end
	return nil
end

local function getCurrentFiberStackInDev()
	-- upvalues: DEV (copy), ReactCurrentFiberModule (copy), GetStackByFiberInDevAndProdFunction (copy)
	return if DEV then if ReactCurrentFiberModule.current == nil then "" else GetStackByFiberInDevAndProdFunction(ReactCurrentFiberModule.current) else ""
end

function ReactCurrentFiberModule.resetCurrentFiber()
	-- upvalues: DEV (copy), ReactDebugCurrentFrame (copy), ReactCurrentFiberModule (copy)
	if DEV then
		ReactDebugCurrentFrame.getCurrentStack = nil
		ReactCurrentFiberModule.current = nil
		ReactCurrentFiberModule.isRendering = false
	end
end

function ReactCurrentFiberModule.setCurrentFiber(Current)
	-- upvalues: DEV (copy), ReactDebugCurrentFrame (copy), getCurrentFiberStackInDev (copy), ReactCurrentFiberModule (copy)
	if DEV then
		ReactDebugCurrentFrame.getCurrentStack = getCurrentFiberStackInDev
		ReactCurrentFiberModule.current = Current
		ReactCurrentFiberModule.isRendering = false
	end
end

function ReactCurrentFiberModule.setIsRendering(IsRendering)
	-- upvalues: DEV (copy), ReactCurrentFiberModule (copy)
	if DEV then
		ReactCurrentFiberModule.isRendering = IsRendering
	end
end

function ReactCurrentFiberModule.getIsRendering()
	-- upvalues: DEV (copy), ReactCurrentFiberModule (copy)
	return if DEV then ReactCurrentFiberModule.isRendering else false
end

return ReactCurrentFiberModule