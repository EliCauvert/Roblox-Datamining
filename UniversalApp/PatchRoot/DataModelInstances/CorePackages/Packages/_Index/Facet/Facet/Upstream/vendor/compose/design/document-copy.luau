local _ = require("./types")

local function copyLiteral(Initial)
	-- upvalues: copyLiteral (copy)
	if type(Initial) ~= "table" then
		return Initial
	end
	local t = {}
	
	for i, value in Initial do
		t[i] = copyLiteral(value)
	end
	return t
end

local function copyValue(Tbl)
	-- upvalues: copyLiteral (copy)
	local Copy = table.clone(Tbl)
	
	if type(Copy.literal) == "table" then
		Copy.literal = copyLiteral(Copy.literal)
	end
	local Args = Copy.args
	
	if Args then
		local Args1 = {}
		
		for i, arg in Args do
			Args1[i] = copyLiteral(arg)
		end
		Copy.args = Args1
	end
	if Copy.path then
		Copy.path = table.clone(Copy.path)
	end
	if Copy.fields then
		Copy.fields = table.clone(Copy.fields)
	end
	if Copy.nodes then
		Copy.nodes = table.clone(Copy.nodes)
	end
	return Copy
end

local function copyNode(Tbl)
	-- upvalues: copyValue (copy), copyNode (copy)
	local Props = {}
	
	for i, prop in Tbl.props do
		Props[i] = copyValue(prop)
	end
	local Children = {}
	
	for i1, child in Tbl.children do
		Children[i1] = copyNode(child)
	end
	local Bind = Tbl.bind
	local RowVariant = nil
	
	if Tbl.rowVariant then
		local Cases = {}
		
		for _, cas in Tbl.rowVariant.cases do
			local Copy = table.clone(Tbl)
			Copy.rowVariant = nil
			Copy.props = cas.props
			Copy.children = cas.children
			local CopyNodeResult = copyNode(Copy)
			table.insert(Cases, {
				value = cas.value,
				kind = cas.kind,
				props = CopyNodeResult.props,
				children = CopyNodeResult.children
			})
		end
		RowVariant = { item = Tbl.rowVariant.item, cases = Cases }
	end
	return {
		id = Tbl.id,
		kind = Tbl.kind,
		name = Tbl.name,
		props = Props,
		children = Children,
		bind = if Bind then { from = Bind.from, key = Bind.key, row = Bind.row } else nil,
		nameField = Tbl.nameField,
		nameInput = Tbl.nameInput,
		when = Tbl.when,
		tags = if Tbl.tags then table.clone(Tbl.tags) else nil,
		hidden = Tbl.hidden,
		locked = Tbl.locked,
		rowVariant = RowVariant,
		tagBinding = if Tbl.tagBinding then copyValue(Tbl.tagBinding) else nil,
		slot = Tbl.slot
	}
end

local function copyFields(Fields)
	-- upvalues: copyFields (copy)
	local t = {}
	
	for i, field in Fields do
		local Fields1 = field.fields
		t[i] = {
			id = field.id,
			type = field.type,
			fields = if Fields1 then copyFields(Fields1) else nil,
			luauType = field.luauType,
			options = if field.options then table.clone(field.options) else nil
		}
	end
	return t
end

local function copyContract(Contract)
	-- upvalues: copyFields (copy), copyLiteral (copy)
	local Inputs = {}
	
	for i, input in Contract.inputs do
		local Fields = input.fields
		local CopyFieldsResult = if Fields then copyFields(Fields) else nil
		local Preview = input.preview
		Inputs[i] = {
			id = input.id,
			kind = input.kind,
			type = input.type,
			preview = if Preview == nil then nil else copyLiteral(Preview),
			fields = CopyFieldsResult,
			required = input.required,
			luauType = input.luauType,
			options = if input.options then table.clone(input.options) else nil
		}
	end
	local Outputs = {}
	
	for i1, output in Contract.outputs do
		local Args = output.args
		Outputs[i1] = {
			id = output.id,
			args = if Args then table.clone(Args) else nil,
			row = output.row
		}
	end
	return { inputs = Inputs, outputs = Outputs }
end

local function copyState(State)
	-- upvalues: copyLiteral (copy)
	if State == nil then
		return nil
	end
	local t = {}
	
	for i, value in State do
		t[i] = {
			id = value.id,
			type = value.type,
			initial = copyLiteral(value.initial)
		}
	end
	return t
end

local function copySequences(Sequences)
	-- upvalues: copyLiteral (copy)
	if Sequences == nil then
		return nil
	end
	local t = {}
	
	for i, sequence in Sequences do
		local Steps = {}
		
		for i1, step in sequence.steps do
			local To = step.to
			Steps[i1] = {
				delay = step.delay,
				duration = step.duration,
				easing = step.easing,
				state = step.state,
				to = if To == nil then nil else copyLiteral(To),
				output = step.output
			}
		end
		t[i] = {
			id = sequence.id,
			autoplay = sequence.autoplay,
			steps = Steps
		}
	end
	return t
end

return {
	literal = copyLiteral,
	value = copyValue,
	node = copyNode,
	contract = copyContract,
	state = copyState,
	sequences = copySequences,
	document = function(p1)
		-- upvalues: copyValue (copy), copyNode (copy), copyContract (copy), copyState (copy), copySequences (copy)
		local RootVariant = p1.rootVariant
		local RootVariant1 = nil
		
		if RootVariant then
			local Props = {}
			
			for i, prop in RootVariant.props do
				Props[i] = copyValue(prop)
			end
			local List = nil
			
			if RootVariant.children then
				List = {}
				
				for _, child in RootVariant.children do
					table.insert(List, (copyNode(child)))
				end
			end
			RootVariant1 = {
				input = RootVariant.input,
				value = RootVariant.value,
				kind = RootVariant.kind,
				props = Props,
				children = List
			}
		end
		return {
			schema = "compose-design/1",
			name = p1.name,
			library = p1.library,
			nextId = p1.nextId,
			contract = copyContract(p1.contract),
			typeImports = if p1.typeImports then table.clone(p1.typeImports) else nil,
			state = copyState(p1.state),
			sequences = copySequences(p1.sequences),
			root = copyNode(p1.root),
			rootVariant = RootVariant1
		}
	end
}