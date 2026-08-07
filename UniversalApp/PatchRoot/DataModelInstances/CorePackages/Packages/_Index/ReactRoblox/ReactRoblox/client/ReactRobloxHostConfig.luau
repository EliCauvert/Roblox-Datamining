local function _(p0) --[[ line: 13 | named "unimplemented" ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(p0))
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

local _ = function(p1) --[[ line: 206 | named "recursivelyUncacheFiberNode" ]]
	-- upvalues: uncacheFiberNode (ref)
	if typeof(p1) ~= "Instance" then return end
	uncacheFiberNode(p1)
	
	for i, v in p1:GetDescendants() do
		uncacheFiberNode(v)
	end
end

local t = {}
object.assign(t, require(parent.Shared).ReactFiberHostConfig.WithNoPersistence)

function t.getRootHostContext(p2) --[[ line: 224 ]]
	return p2.ClassName
end

function t.getChildHostContext(p3, _, _) --[[ line: 262 ]]
	return p3
end

function t.getPublicInstance(p4) --[[ line: 283 ]]
	return p4
end

function t.prepareForCommit(_) --[[ line: 287 ]]
	-- upvalues: enableCreateEventHandleAPI (ref)
	if enableCreateEventHandleAPI then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
		error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
	end
	return nil
end

function t.beforeActiveInstanceBlur() --[[ line: 302 ]]
	-- upvalues: enableCreateEventHandleAPI (ref)
	if enableCreateEventHandleAPI then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
		error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
	end
end

function t.afterActiveInstanceBlur() --[[ line: 311 ]]
	-- upvalues: enableCreateEventHandleAPI (ref)
	if enableCreateEventHandleAPI then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
		error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
	end
end

function t.resetAfterCommit(_) --[[ line: 320 ]] end

function t.createInstance(p5, p6, _, _, p7) --[[ line: 328 ]]
	-- upvalues: precacheFiberNode (ref), updateFiberProps (ref)
	local var7 = Instance.new(p5)
	
	if p7.key then
		var7.Name = p7.key
	else
		local _return = p7.return_
		while _return do
			if not _return.key then
				_return = _return.return_
				continue
			end
			var7.Name = _return.key
			break
		end
	end
	precacheFiberNode(p7, var7)
	updateFiberProps(var7, p6)
	
	return var7
end

function t.appendInitialChild(p8, p9) --[[ line: 395 ]]
	p9.Parent = p8
end

function t.finalizeInitialChildren(p10, p11, p12, p13, _) --[[ line: 400 ]]
	-- upvalues: setInitialProperties (ref)
	setInitialProperties(p10, p11, p12, p13)
	
	return false
end

function t.prepareUpdate(p14, p15, p16, p17, p18, _) --[[ line: 412 ]]
	-- upvalues: diffProperties (ref)
	return diffProperties(p14, p15, p16, p17, p18)
end

function t.shouldSetTextContent(_, _) --[[ line: 439 ]]
	return false
end

function t.createTextInstance(_, _, _, _) --[[ line: 455 ]]
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

function t.commitMount(_, _, _, _) --[[ line: 481 ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("commitMount"))
	error("FIXME (roblox): commitMount is unimplemented", 2)
end

function t.commitUpdate(p19, p20, _, p21, p22, _) --[[ line: 503 ]]
	-- upvalues: updateFiberProps (ref), updateProperties (ref)
	updateFiberProps(p19, p22)
	updateProperties(p19, p20, p21)
end

local function checkTags(p23) --[[ line: 532 ]]
	-- upvalues: console (ref), inspect (ref), collectionService (ref)
	if typeof(p23) ~= "Instance" then
		console.warn("Could not check tags on non-instance %s.", inspect(p23))
		
		return
	elseif not p23:IsDescendantOf(game) and #collectionService:GetTags(p23) > 0 then
		console.warn("Tags applied to orphaned %s \"%s\" cannot be accessed via CollectionService:GetTagged. If you're relying on tag behavior in a unit test, consider mounting your test root into the DataModel.", p23.ClassName, p23.Name)
	end
end

function t.appendChild(p24, p25) --[[ line: 551 ]]
	-- upvalues: reactGlobalsModule (ref), checkTags (ref)
	p25.Parent = p24
	
	if reactGlobalsModule.__DEV__ then
		checkTags(p25)
	end
end

function t.appendChildToContainer(p26, p27) --[[ line: 560 ]]
	-- upvalues: t (ref)
	t.appendChild(p26, p27)
end

function t.insertBefore(p28, p29, _) --[[ line: 589 ]]
	-- upvalues: reactGlobalsModule (ref), checkTags (ref)
	p29.Parent = p28
	
	if reactGlobalsModule.__DEV__ then
		checkTags(p29)
	end
end

function t.insertInContainerBefore(p30, p31, p32) --[[ line: 602 ]]
	-- upvalues: t (ref)
	t.insertBefore(p30, p31, p32)
end

function t.removeChild(_, p33) --[[ line: 644 ]]
	-- upvalues: uncacheFiberNode (ref), cleanupHostComponent (ref)
	if typeof(p33) == "Instance" then
		uncacheFiberNode(p33)
		
		for i, v in p33:GetDescendants() do
			uncacheFiberNode(v)
		end
	end
	cleanupHostComponent(p33)
	p33.Parent = nil
	p33:Destroy()
end

function t.removeChildFromContainer(p34, p35) --[[ line: 656 ]]
	-- upvalues: t (ref)
	t.removeChild(p34, p35)
end

function t.clearSuspenseBoundary(_, _) --[[ line: 667 ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundary"))
	error("FIXME (roblox): clearSuspenseBoundary is unimplemented", 2)
end

function t.clearSuspenseBoundaryFromContainer(_, _) --[[ line: 707 ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundaryFromContainer"))
	error("FIXME (roblox): clearSuspenseBoundaryFromContainer is unimplemented", 2)
end

function t.hideInstance(_) --[[ line: 724 ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("hideInstance"))
	error("FIXME (roblox): hideInstance is unimplemented", 2)
end

function t.hideTextInstance(_) --[[ line: 738 ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("hideTextInstance"))
	error("FIXME (roblox): hideTextInstance is unimplemented", 2)
end

function t.unhideInstance(_, _) --[[ line: 743 ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("unhideInstance"))
	error("FIXME (roblox): unhideInstance is unimplemented", 2)
end

function t.unhideTextInstance(_, _) --[[ line: 757 ]]
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("unhideTextInstance"))
	error("FIXME (roblox): unhideTextInstance is unimplemented", 2)
end

function t.clearContainer(p36) --[[ line: 762 ]]
	-- upvalues: t (ref)
	for i, v in p36:GetChildren() do
		t.removeChild(p36, v)
	end
end

function t.preparePortalMount(_) --[[ line: 1205 ]] end

return t