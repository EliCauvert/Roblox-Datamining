local function _(Text)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring(Text))
	error("FIXME (roblox): " .. Text .. " is unimplemented", 2)
end

local CollectionService = game:GetService("CollectionService")
local Parent = script.Parent.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local InspectFunction = LuauPolyfillModule.util.inspect
local Console = require(Parent.Shared).console
local SetTimeout = LuauPolyfillModule.setTimeout
local ClearTimeout = LuauPolyfillModule.clearTimeout
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"])
local ReactRobloxComponentTreeModule = require(script.Parent.ReactRobloxComponentTree)
local PrecacheFiberNodeFunction = ReactRobloxComponentTreeModule.precacheFiberNode
local UncacheFiberNodeFunction = ReactRobloxComponentTreeModule.uncacheFiberNode
local UpdateFiberPropsFunction = ReactRobloxComponentTreeModule.updateFiberProps
local ReactRobloxComponentModule = require(script.Parent.ReactRobloxComponent)
local SetInitialPropertiesFunction = ReactRobloxComponentModule.setInitialProperties
local DiffPropertiesFunction = ReactRobloxComponentModule.diffProperties
local UpdatePropertiesFunction = ReactRobloxComponentModule.updateProperties
local CleanupHostComponentFunction = ReactRobloxComponentModule.cleanupHostComponent
local EnableCreateEventHandleAPI = require(Parent.Shared).ReactFeatureFlags.enableCreateEventHandleAPI

local _ = function(Object)
	-- upvalues: UncacheFiberNodeFunction (copy)
	if typeof(Object) ~= "Instance" then return end
	UncacheFiberNodeFunction(Object)
	
	for _, descendant in Object:GetDescendants() do
		UncacheFiberNodeFunction(descendant)
	end
end

local ReactRobloxHostConfig = {}
LuauPolyfillModule.Object.assign(ReactRobloxHostConfig, require(Parent.Shared).ReactFiberHostConfig.WithNoPersistence)

function ReactRobloxHostConfig.getRootHostContext(p1)
	return p1.ClassName
end

function ReactRobloxHostConfig.getChildHostContext(p1, _, _)
	return p1
end

function ReactRobloxHostConfig.getPublicInstance(p1)
	return p1
end

function ReactRobloxHostConfig:prepareForCommit()
	-- upvalues: EnableCreateEventHandleAPI (copy)
	if EnableCreateEventHandleAPI then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
		error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
	end
	return nil
end

function ReactRobloxHostConfig.beforeActiveInstanceBlur()
	-- upvalues: EnableCreateEventHandleAPI (copy)
	if EnableCreateEventHandleAPI then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
		error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
	end
end

function ReactRobloxHostConfig.afterActiveInstanceBlur()
	-- upvalues: EnableCreateEventHandleAPI (copy)
	if EnableCreateEventHandleAPI then
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
		print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
		error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
	end
end

function ReactRobloxHostConfig:resetAfterCommit() end

function ReactRobloxHostConfig.createInstance(p1, p2, _, _, p3)
	-- upvalues: PrecacheFiberNodeFunction (copy), UpdateFiberPropsFunction (copy)
	local NewInstance = Instance.new(p1)
	
	if p3.key then
		NewInstance.Name = p3.key
	else
		local Return = p3.return_
		while Return do
			if not Return.key then
				Return = Return.return_
				continue
			end
			NewInstance.Name = Return.key
			break
		end
	end
	PrecacheFiberNodeFunction(p3, NewInstance)
	UpdateFiberPropsFunction(NewInstance, p2)
	
	return NewInstance
end

function ReactRobloxHostConfig.appendInitialChild(Parent, p4)
	p4.Parent = Parent
end

function ReactRobloxHostConfig.finalizeInitialChildren(p4, p5, p6, p7, _): boolean
	-- upvalues: SetInitialPropertiesFunction (copy)
	SetInitialPropertiesFunction(p4, p5, p6, p7)
	
	return false
end

function ReactRobloxHostConfig.prepareUpdate(p4, p5, p6, p7, p8, _)
	-- upvalues: DiffPropertiesFunction (copy)
	return DiffPropertiesFunction(p4, p5, p6, p7, p8)
end

function ReactRobloxHostConfig:shouldSetTextContent(_): boolean
	return false
end

function ReactRobloxHostConfig:createTextInstance(_, _, _)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("createTextInstance"))
	error("FIXME (roblox): createTextInstance is unimplemented", 2)
	
	return nil
end

ReactRobloxHostConfig.isPrimaryRenderer = true
ReactRobloxHostConfig.warnsIfNotActing = true
ReactRobloxHostConfig.scheduleTimeout = SetTimeout
ReactRobloxHostConfig.cancelTimeout = ClearTimeout
ReactRobloxHostConfig.noTimeout = -1
ReactRobloxHostConfig.supportsMutation = true

function ReactRobloxHostConfig:commitMount(_, _, _)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("commitMount"))
	error("FIXME (roblox): commitMount is unimplemented", 2)
end

function ReactRobloxHostConfig.commitUpdate(p4, p5, _, p6, p7, _)
	-- upvalues: UpdateFiberPropsFunction (copy), UpdatePropertiesFunction (copy)
	UpdateFiberPropsFunction(p4, p7)
	UpdatePropertiesFunction(p4, p5, p6)
end

local function checkTags(Object)
	-- upvalues: Console (copy), InspectFunction (copy), CollectionService (copy)
	if typeof(Object) ~= "Instance" then
		Console.warn("Could not check tags on non-instance %s.", InspectFunction(Object))
		
		return
	end
	if not Object:IsDescendantOf(game) and #CollectionService:GetTags(Object) > 0 then
		Console.warn("Tags applied to orphaned %s \"%s\" cannot be accessed via CollectionService:GetTagged. If you're relying on tag behavior in a unit test, consider mounting your test root into the DataModel.", Object.ClassName, Object.Name)
	end
end

function ReactRobloxHostConfig.appendChild(Parent, p4)
	-- upvalues: ReactGlobalsModule (copy), checkTags (copy)
	p4.Parent = Parent
	
	if ReactGlobalsModule.__DEV__ then
		checkTags(p4)
	end
end

function ReactRobloxHostConfig.appendChildToContainer(Parent, p4)
	-- upvalues: ReactRobloxHostConfig (copy)
	ReactRobloxHostConfig.appendChild(Parent, p4)
end

function ReactRobloxHostConfig.insertBefore(Parent, p4, _)
	-- upvalues: ReactGlobalsModule (copy), checkTags (copy)
	p4.Parent = Parent
	
	if ReactGlobalsModule.__DEV__ then
		checkTags(p4)
	end
end

function ReactRobloxHostConfig.insertInContainerBefore(Parent, p4, p5)
	-- upvalues: ReactRobloxHostConfig (copy)
	ReactRobloxHostConfig.insertBefore(Parent, p4, p5)
end

function ReactRobloxHostConfig:removeChild(Object)
	-- upvalues: UncacheFiberNodeFunction (copy), CleanupHostComponentFunction (copy)
	if typeof(Object) == "Instance" then
		UncacheFiberNodeFunction(Object)
		
		for _, descendant in Object:GetDescendants() do
			UncacheFiberNodeFunction(descendant)
		end
	end
	CleanupHostComponentFunction(Object)
	Object.Parent = nil
	Object:Destroy()
end

function ReactRobloxHostConfig.removeChildFromContainer(p4, p5)
	-- upvalues: ReactRobloxHostConfig (copy)
	ReactRobloxHostConfig.removeChild(p4, p5)
end

function ReactRobloxHostConfig:clearSuspenseBoundary(_)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundary"))
	error("FIXME (roblox): clearSuspenseBoundary is unimplemented", 2)
end

function ReactRobloxHostConfig:clearSuspenseBoundaryFromContainer(_)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundaryFromContainer"))
	error("FIXME (roblox): clearSuspenseBoundaryFromContainer is unimplemented", 2)
end

function ReactRobloxHostConfig:hideInstance()
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("hideInstance"))
	error("FIXME (roblox): hideInstance is unimplemented", 2)
end

function ReactRobloxHostConfig:hideTextInstance()
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("hideTextInstance"))
	error("FIXME (roblox): hideTextInstance is unimplemented", 2)
end

function ReactRobloxHostConfig:unhideInstance(_)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("unhideInstance"))
	error("FIXME (roblox): unhideInstance is unimplemented", 2)
end

function ReactRobloxHostConfig:unhideTextInstance(_)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print("UNIMPLEMENTED ERROR: " .. tostring("unhideTextInstance"))
	error("FIXME (roblox): unhideTextInstance is unimplemented", 2)
end

function ReactRobloxHostConfig.clearContainer(Object)
	-- upvalues: ReactRobloxHostConfig (copy)
	for _, child in Object:GetChildren() do
		ReactRobloxHostConfig.removeChild(Object, child)
	end
end

function ReactRobloxHostConfig:preparePortalMount() end

return ReactRobloxHostConfig