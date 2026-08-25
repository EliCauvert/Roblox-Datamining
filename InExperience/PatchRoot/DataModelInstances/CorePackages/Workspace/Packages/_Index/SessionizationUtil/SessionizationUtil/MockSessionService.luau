local signal = require(script:FindFirstAncestor("SessionizationUtil").Parent.AppCommonLib).Signal
local t = {}
t.__index = t

function t.new(p0, p1)
	-- upvalues: t (ref)
	local t_1 = {
		parent = nil,
		sid = p0,
		tag = p1,
		metadata = {},
		children = {},
		timestamp = tick()
	}
	setmetatable(t_1, { __index = t })
	
	return t_1
end

function t:addChild(p2, p3)
	-- upvalues: t (ref)
	local var3 = t.new(p2, p3)
	var3.parent = self
	self.children[p2] = var3
end

function t:dump(p4, p5)
	p5 ..= `{p4} sid: {self.sid}, tag: {self.tag}\n`
	p4 ..= "----"
	
	for i, v in self.children do
		p5 = v:dump(p4, p5)
	end
	return p5
end

function findSid(p6, p7)
	if p6.sid == p7 then
		return p6
	end
	for i, v in p6.children do
		local var4 = findSid(v, p7)
		
		if var4 ~= nil then
			return var4
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

function t_1:_findSid(p8)
	return findSid(self.mockRootNode, p8)
end

function t_1:_dumpSessionTree()
	return if self.mockRootNode == nil then "Root node is nil!" else self.mockRootNode:dump("", "")
end

function t_1:GetRootSID()
	return self.MOCK_ROOT_SID
end

function t_1:SetSession(p9, p10, p11)
	;(findSid(self.mockRootNode, p9) or self.mockRootNode):addChild(p10, p11)
end

function t_1:ReplaceSession(p12, p13)
	local var6 = findSid(self.mockRootNode, p12)
	
	if var6 ~= nil and var6.parent ~= nil then
		var6.parent.children[p12] = nil
		var6.parent:addChild(p12, p13)
	end
end

function t_1:RemoveSession(p14)
	local var7 = findSid(self.mockRootNode, p14)
	
	if var7 ~= nil then
		local parent = var7.parent
		
		if parent ~= nil then
			parent.children[p14] = nil
		end
	end
end

function t_1:GetMetadata(p15, p16)
	local var8 = findSid(self.mockRootNode, p15)
	
	return if var8 == nil then nil else var8.metadata[p16]
end

function t_1:SetMetadata(p17, p18, p19)
	local var9 = findSid(self.mockRootNode, p17)
	
	if var9 ~= nil then
		var9.metadata[p18] = p19
	end
end

function t_1:SessionExists(p20)
	return findSid(self.mockRootNode, p20) ~= nil
end

function t_1:RemoveSessionsWithMetadataKey(p21)
	if p21 == nil then return end
	local function findNodeWithMetadataKey(p22, p23)
		-- upvalues: findNodeWithMetadataKey (ref)
		if p23 ~= nil then
			if p23.metadata[p22] ~= nil then
				return p23
			end
			for i, v in p23.children do
				local var12 = findNodeWithMetadataKey(p22, v)
				
				if var12 ~= nil then
					return var12
				end
			end
		end
		return nil
	end
	
	local var11 = findNodeWithMetadataKey(p21, self.mockRootNode)
	while var11 ~= nil do
		self:RemoveSession(var11.sid)
		var11 = findNodeWithMetadataKey(p21, self.mockRootNode)
	end
end

function t_1.generateSessionInfoString(_, _, _, _, _)
	return ""
end

function t_1:GetSessionTag(p24)
	local var13 = findSid(self.mockRootNode, p24)
	
	return if var13 == nil then "" else var13.tag
end

return t_1