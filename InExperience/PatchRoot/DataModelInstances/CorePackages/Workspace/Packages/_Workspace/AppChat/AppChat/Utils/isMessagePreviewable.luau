return function(p1)
	return if p1.isPreviewable == nil then p1.is_previewable ~= nil and p1.is_previewable else p1.isPreviewable
end