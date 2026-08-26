local signal = require(script:FindFirstAncestor("SessionizationUtil").Parent.AppCommonLib).Signal
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: t (ref)
	local t_1 = {
		parent = nil,
		sid = p1,
		tag = p2,
		metadata = {},
		children = {},
		timestamp = tick()
	}
	setmetatable(t_1, { __index = t })
	
	return t_1
end

function t:addChild(p1, p2)
	-- upvalues: t (ref)
	local var1 = t.new(p1, p2)
	var1.parent = self
	self.children[p1] = var1
end

function t:dump(p1, p2)
	p2 ..= `{p1} sid: {self.sid}, tag: {self.tag}\n`
	p1 ..= "----"
	
	for i, v in self.children do
		p2 = v:dump(p1, p2)
	end
	return p2
end

function findSid(p3, p4)
	if p3.sid == p4 then
		return p3
	end
	for i, v in p3.children do
		local var1 = findSid(v, p4)
		
		if var1 ~= nil then
			return var1
		end
	end
	return nil
end

local t_1 = { MOCK_ROOT_SID = "MOCK_ROOT_SID" }
t_1.__index = t_1

function t_1.new()
	-- upvalues: t (ref), t_1 (ref), signal (ref)
	local t_2 = {
		mockRootNode = t.new(t_1.MOCK_ROOT_SID, t_1.MOCK_ROOT_SID),
		SessionChangedSignal = signal.new()
	}
	setmetatable(t_2, { __index = t_1 })
	
	return t_2
end

function t_1:_resetMockData()
	-- upvalues: t (ref), t_1 (ref)
	self.mockRootNode = t.new(t_1.MOCK_ROOT_SID, t_1.MOCK_ROOT_SID)
end

function t_1:_findSid(p5)
	return findSid(self.mockRootNode, p5)
end

function t_1:_dumpSessionTree()
	return if self.mockRootNode == nil then "Root node is nil!" else self.mockRootNode:dump("", "")
end

function t_1:GetRootSID()
	return self.MOCK_ROOT_SID
end

function t_1:SetSession(p5, p6, p7)
	;(findSid(self.mockRootNode, p5) or self.mockRootNode):addChild(p6, p7)
end

function t_1:ReplaceSession(p5, p6)
	local var2 = findSid(self.mockRootNode, p5)
	
	if var2 ~= nil and var2.parent ~= nil then
		var2.parent.children[p5] = nil
		var2.parent:addChild(p5, p6)
	end
end

function t_1:RemoveSession(p5)
	local var2 = findSid(self.mockRootNode, p5)
	
	if var2 ~= nil then
		local parent = var2.parent
		
		if parent ~= nil then
			parent.children[p5] = nil
		end
	end
end

function t_1:GetMetadata(p5, p6)
	local var2 = findSid(self.mockRootNode, p5)
	
	return if var2 == nil then nil else var2.metadata[p6]
end

function t_1:SetMetadata(p5, p6, p7)
	local var2 = findSid(self.mockRootNode, p5)
	
	if var2 ~= nil then
		var2.metadata[p6] = p7
	end
end

function t_1:SessionExists(p5)
	return findSid(self.mockRootNode, p5) ~= nil
end

function t_1:RemoveSessionsWithMetadataKey(p5)
	if p5 == nil then return end
	local function findNodeWithMetadataKey(p6, p7)
		-- upvalues: findNodeWithMetadataKey (ref)
		if p7 ~= nil then
			if p7.metadata[p6] ~= nil then
				return p7
			end
			for i, v in p7.children do
				local var2 = findNodeWithMetadataKey(p6, v)
				
				if var2 ~= nil then
					return var2
				end
			end
		end
		return nil
	end
	
	local var3 = findNodeWithMetadataKey(p5, self.mockRootNode)
	while var3 ~= nil do
		self:RemoveSession(var3.sid)
		var3 = findNodeWithMetadataKey(p5, self.mockRootNode)
	end
end

function t_1.generateSessionInfoString(_, _, _, _, _)
	return ""
end

function t_1:GetSessionTag(p8)
	local var4 = findSid(self.mockRootNode, p8)
	
	return if var4 == nil then "" else var4.tag
end

return t_1