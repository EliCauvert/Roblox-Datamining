local Upstream = script.Upstream
local Patches = script.Patches

local function _(Object, p1)
	if p1 ~= nil then
		local Name = Object:FindFirstChild(p1.Name)
		assert(Name ~= nil, `Facet has no module {p1.Name} in {Object:GetFullName()}`)
		Name:Destroy()
		p1.Parent = Object
		
		return
	end
end

local Ui = Upstream.ui
local CollectionRows = Patches:FindFirstChild("collection_rows")

if CollectionRows ~= nil then
	local Name = Ui:FindFirstChild(CollectionRows.Name)
	assert(Name ~= nil, `Facet has no module {CollectionRows.Name} in {Ui:GetFullName()}`)
	Name:Destroy()
	CollectionRows.Parent = Ui
end
local Collection = Upstream.vendor.compose.core.collection
local Retain = Patches:FindFirstChild("retain")

if Retain ~= nil then
	local Name = Collection:FindFirstChild(Retain.Name)
	assert(Name ~= nil, `Facet has no module {Retain.Name} in {Collection:GetFullName()}`)
	Name:Destroy()
	Retain.Parent = Collection
end
return (require(Upstream))