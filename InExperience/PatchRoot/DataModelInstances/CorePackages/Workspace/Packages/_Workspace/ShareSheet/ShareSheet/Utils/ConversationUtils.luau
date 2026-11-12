return {
	getDisplayName = function(p1)
		local TitleForViewer = p1.titleForViewer
		
		return if TitleForViewer and TitleForViewer ~= "" then TitleForViewer else p1.title or ""
	end
}