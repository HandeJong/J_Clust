function unit_pts = add_pts_to_cl(unit_pts, selected_pts, edit_cl)

%Description: This .m file adds spikes to a user selected cluster(s)
%
%Input: 'unit_pts' = points belonging to all current units, 'selected_pts' = user selected points from main GUI, 
%'edit_cl' = vector containing info on which cluster(s) to add points to 
%
%Output: 'unit_pts' = updated 'unit_pts'
%

if isempty(selected_pts)
    error('No points selected')
end

if ~sum(edit_cl(:))
    error('No cluster selected')
end

units_to_add_to = find(edit_cl);

if max(units_to_add_to) > 12
    error('Cannot add spikes to "Selected Spikes" or "All Non-Clustered Spikes"');
end

%add points to selected unit(s)
for i = 1:length(units_to_add_to)
    if units_to_add_to(i) > length(unit_pts)
        unit_pts{units_to_add_to(i)} = 0;
    end
    added_unit = unit_pts{units_to_add_to(i)};
    added_unit = [added_unit; selected_pts'];
    added_unit(added_unit == 0) = [];
    unit_pts{units_to_add_to(i)} = added_unit;
end

end
    
