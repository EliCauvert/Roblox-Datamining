local Signal = require(script:FindFirstAncestor("SessionizationUtil").Parent.AppCommonLib).Signal
local Module = {}
Module.__index = Module

function Module.new(Sid, Tag) --[[ Line: 10 ]]
	-- upvalues: Module (copy)
	local config = {
		parent = nil,
		sid = Sid,
		tag = Tag,
		metadata = {},
		children = {},
		timestamp = tick()
	}
	setmetatable(config, { __index = Module })
	
	return config
end

function Module:addChild(Sid, Tag) --[[ Line: 27 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new(Sid, Tag)
	NewModule.parent = self
	self.children[Sid] = NewModule
end

function Module:dump(Text, DumpResult) --[[ Line: 34 ]]
	local Text1 = DumpResult .. `{Text} sid: {self.sid}, tag: {self.tag}\n`
	local Text2 = Text .. "----"
	
	for _, child in self.children do
		Text1 = child:dump(Text2, Text1)
	end
	return Text1
end

function findSid(p1, Sid) --[[ Line: 44 ]]
	if p1.sid == Sid then
		return p1
	end
	local Sid1 = nil
	for _, child in p1.children do
		Sid1 = findSid(child, Sid)
		
		if Sid1 ~= nil then
			return Sid1
		end
	end
	return nil
end

local MockSessionService = { MOCK_ROOT_SID = "MOCK_ROOT_SID" }
MockSessionService.__index = MockSessionService

function MockSessionService.new() --[[ Line: 65 ]]
	-- upvalues: Module (copy), MockSessionService (copy), Signal (copy)
	local config = {
		mockRootNode = Module.new(MockSessionService.MOCK_ROOT_SID, MockSessionService.MOCK_ROOT_SID),
		SessionChangedSignal = Signal.new()
	}
	setmetatable(config, { __index = MockSessionService })
	
	return config
end

function MockSessionService:_resetMockData() --[[ Line: 78 ]]
	-- upvalues: Module (copy), MockSessionService (copy)
	self.mockRootNode = Module.new(MockSessionService.MOCK_ROOT_SID, MockSessionService.MOCK_ROOT_SID)
end

function MockSessionService:_findSid(p2) --[[ Line: 82 ]]
	return findSid(self.mockRootNode, p2)
end

function MockSessionService._dumpSessionTree(p2) --[[ Line: 86 ]]
	return if p2.mockRootNode == nil then "Root node is nil!" else p2.mockRootNode:dump("", "")
end

function MockSessionService:GetRootSID() --[[ Line: 94 ]]
	return self.MOCK_ROOT_SID
end

function MockSessionService:SetSession(p2, p3, p4) --[[ Line: 98 ]]
	(findSid(self.mockRootNode, p2) or self.mockRootNode):addChild(p3, p4)
end

function MockSessionService:ReplaceSession(p2, p3) --[[ Line: 104 ]]
	local Sid = findSid(self.mockRootNode, p2)
	
	if Sid ~= nil and Sid.parent ~= nil then
		Sid.parent.children[p2] = nil
		Sid.parent:addChild(p2, p3)
	end
end

function MockSessionService:RemoveSession(Sid) --[[ Line: 114 ]]
	local Sid1 = findSid(self.mockRootNode, Sid)
	
	if Sid1 ~= nil then
		local Parent = Sid1.parent
		
		if Parent ~= nil then
			Parent.children[Sid] = nil
		end
	end
end

function MockSessionService:GetMetadata(p2, p3) --[[ Line: 124 ]]
	local Sid = findSid(self.mockRootNode, p2)
	
	return if Sid == nil then nil else Sid.metadata[p3]
end

function MockSessionService:SetMetadata(p2, p3, p4) --[[ Line: 133 ]]
	local Sid = findSid(self.mockRootNode, p2)
	
	if Sid ~= nil then
		Sid.metadata[p3] = p4
	end
end

function MockSessionService:SessionExists(p2): boolean --[[ Line: 140 ]]
	return findSid(self.mockRootNode, p2) ~= nil
end

function MockSessionService:RemoveSessionsWithMetadataKey(p2) --[[ Line: 145 ]]
	if p2 == nil then return end
	local function findNodeWithMetadataKey(p3, MockRootNode) --[[ Line: 150 ]]
		-- upvalues: findNodeWithMetadataKey (copy)
		if MockRootNode ~= nil then
			if MockRootNode.metadata[p3] ~= nil then
				return MockRootNode
			end
			local NodeWithMetadataKey = nil
			for _, child in MockRootNode.children do
				NodeWithMetadataKey = findNodeWithMetadataKey(p3, child)
				
				if NodeWithMetadataKey ~= nil then
					return NodeWithMetadataKey
				end
			end
		end
		return nil
	end
	
	local NodeWithMetadataKey = findNodeWithMetadataKey(p2, self.mockRootNode)
	while NodeWithMetadataKey ~= nil do
		self:RemoveSession(NodeWithMetadataKey.sid)
		NodeWithMetadataKey = findNodeWithMetadataKey(p2, self.mockRootNode)
	end
end

function MockSessionService:generateSessionInfoString(_, _, _, _): string --[[ Line: 174 ]]
	return ""
end

function MockSessionService:GetSessionTag(p4) --[[ Line: 183 ]]
	local Sid = findSid(self.mockRootNode, p4)
	
	return if Sid == nil then "" else Sid.tag
end

return MockSessionService