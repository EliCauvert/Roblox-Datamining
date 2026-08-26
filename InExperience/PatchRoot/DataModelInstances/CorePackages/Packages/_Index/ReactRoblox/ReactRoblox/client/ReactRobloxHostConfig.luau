local function _(p1)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(p1))
	error("FIXME (roblox): " .. p0 .. " is unimplemented", 2)
end

local collectionService = game:GetService("CollectionService")
local parent = script.Parent.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local inspect = luauPolyfillModule.util.inspect
local console = require(parent.Shared).console
local object = luauPolyfillModule.Object
local setTimeout = luauPolyfillModule.setTimeout
local clearTimeout = luauPolyfillModule.clearTimeout
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"])
local reactRobloxComponentTreeModule = require(script.Parent.ReactRobloxComponentTree)
local precacheFiberNode = reactRobloxComponentTreeModule.precacheFiberNode
local uncacheFiberNode = reactRobloxComponentTreeModule.uncacheFiberNode
local updateFiberProps = reactRobloxComponentTreeModule.updateFiberProps
local reactRobloxComponentModule = require(script.Parent.ReactRobloxComponent)
local setInitialProperties = reactRobloxComponentModule.setInitialProperties
local diffProperties = reactRobloxComponentModule.diffProperties
local updateProperties = reactRobloxComponentModule.updateProperties
local cleanupHostComponent = reactRobloxComponentModule.cleanupHostComponent
local enableCreateEventHandleAPI = require(parent.Shared).ReactFeatureFlags.enableCreateEventHandleAPI

local _ = function(p1)
	-- upvalues: uncacheFiberNode (ref)
	if typeof(p1) ~= "Instance" then return end
	uncacheFiberNode(p1)
	
	for i, v in p1:GetDescendants() do
		uncacheFiberNode(v)
	end
end

local t = {}
object.assign(t, require(parent.Shared).ReactFiberHostConfig.WithNoPersistence)

function t.getRootHostContext(p2)
	return p2.ClassName
end

function t.getChildHostContext(p2, _, _)
	return p2
end

function t.getPublicInstance(p2)
	return p2
end

function t.prepareForCommit(_)
	-- upvalues: enableCreateEventHandleAPI (ref)
	if enableCreateEventHandleAPI then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
		error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
	end
	return nil
end

function t.beforeActiveInstanceBlur()
	-- upvalues: enableCreateEventHandleAPI (ref)
	if enableCreateEventHandleAPI then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
		error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
	end
end

function t.afterActiveInstanceBlur()
	-- upvalues: enableCreateEventHandleAPI (ref)
	if enableCreateEventHandleAPI then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
		error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
	end
end

function t.resetAfterCommit(_) end

function t.createInstance(p2, p3, _, _, p4)
	-- upvalues: precacheFiberNode (ref), updateFiberProps (ref)
	local var1 = Instance.new(p2)
	
	if p4.key then
		var1.Name = p4.key
	else
		local _return = p4.return_
		while _return do
			if not _return.key then
				_return = _return.return_
				continue
			end
			var1.Name = _return.key
			break
		end
	end
	precacheFiberNode(p4, var1)
	updateFiberProps(var1, p3)
	
	return var1
end

function t.appendInitialChild(p5, p6)
	p6.Parent = p5
end

function t.finalizeInitialChildren(p5, p6, p7, p8, _)
	-- upvalues: setInitialProperties (ref)
	setInitialProperties(p5, p6, p7, p8)
	
	return false
end

function t.prepareUpdate(p5, p6, p7, p8, p9, _)
	-- upvalues: diffProperties (ref)
	return diffProperties(p5, p6, p7, p8, p9)
end

function t.shouldSetTextContent(_, _)
	return false
end

function t.createTextInstance(_, _, _, _)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("createTextInstance"))
	error("FIXME (roblox): createTextInstance is unimplemented", 2)
	
	return nil
end

t.isPrimaryRenderer = true
t.warnsIfNotActing = true
t.scheduleTimeout = setTimeout
t.cancelTimeout = clearTimeout
t.noTimeout = -1
t.supportsMutation = true

function t.commitMount(_, _, _, _)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("commitMount"))
	error("FIXME (roblox): commitMount is unimplemented", 2)
end

function t.commitUpdate(p5, p6, _, p7, p8, _)
	-- upvalues: updateFiberProps (ref), updateProperties (ref)
	updateFiberProps(p5, p8)
	updateProperties(p5, p6, p7)
end

local function checkTags(p5)
	-- upvalues: console (ref), inspect (ref), collectionService (ref)
	if typeof(p5) ~= "Instance" then
		console.warn("Could not check tags on non-instance %s.", inspect(p5))
		
		return
	elseif not p5:IsDescendantOf(game) and #collectionService:GetTags(p5) > 0 then
		console.warn("Tags applied to orphaned %s \"%s\" cannot be accessed via CollectionService:GetTagged. If you're relying on tag behavior in a unit test, consider mounting your test root into the DataModel.", p5.ClassName, p5.Name)
	end
end

function t.appendChild(p5, p6)
	-- upvalues: reactGlobalsModule (ref), checkTags (ref)
	p6.Parent = p5
	
	if reactGlobalsModule.__DEV__ then
		checkTags(p6)
	end
end

function t.appendChildToContainer(p5, p6)
	-- upvalues: t (ref)
	t.appendChild(p5, p6)
end

function t.insertBefore(p5, p6, _)
	-- upvalues: reactGlobalsModule (ref), checkTags (ref)
	p6.Parent = p5
	
	if reactGlobalsModule.__DEV__ then
		checkTags(p6)
	end
end

function t.insertInContainerBefore(p5, p6, p7)
	-- upvalues: t (ref)
	t.insertBefore(p5, p6, p7)
end

function t.removeChild(_, p5)
	-- upvalues: uncacheFiberNode (ref), cleanupHostComponent (ref)
	if typeof(p5) == "Instance" then
		uncacheFiberNode(p5)
		
		for i, v in p5:GetDescendants() do
			uncacheFiberNode(v)
		end
	end
	cleanupHostComponent(p5)
	p5.Parent = nil
	p5:Destroy()
end

function t.removeChildFromContainer(p6, p7)
	-- upvalues: t (ref)
	t.removeChild(p6, p7)
end

function t.clearSuspenseBoundary(_, _)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundary"))
	error("FIXME (roblox): clearSuspenseBoundary is unimplemented", 2)
end

function t.clearSuspenseBoundaryFromContainer(_, _)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundaryFromContainer"))
	error("FIXME (roblox): clearSuspenseBoundaryFromContainer is unimplemented", 2)
end

function t.hideInstance(_)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("hideInstance"))
	error("FIXME (roblox): hideInstance is unimplemented", 2)
end

function t.hideTextInstance(_)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("hideTextInstance"))
	error("FIXME (roblox): hideTextInstance is unimplemented", 2)
end

function t.unhideInstance(_, _)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("unhideInstance"))
	error("FIXME (roblox): unhideInstance is unimplemented", 2)
end

function t.unhideTextInstance(_, _)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("unhideTextInstance"))
	error("FIXME (roblox): unhideTextInstance is unimplemented", 2)
end

function t.clearContainer(p6)
	-- upvalues: t (ref)
	for i, v in p6:GetChildren() do
		t.removeChild(p6, v)
	end
end

function t.preparePortalMount(_) end

return t