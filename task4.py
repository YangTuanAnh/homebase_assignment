class NestedSetModelConverter:
    def __init__(self):
        pass

    def convert_to_nested_set(self, hierarchical_data, parent_id=None):
        for node in hierarchical_data:
            if parent_id is not None:
                node['parent_id'] = parent_id

            if 'children' in node and node['children']:
                self.convert_to_nested_set(node['children'], parent_id=node['id'])

    def retrieve_parent_child_relationships(self, nested_set_data, relationships={}):
        for node in nested_set_data:
            parent_id = node.get('parent_id')
            
            if parent_id is not None:
                if parent_id not in relationships:
                    relationships[parent_id] = []
                relationships[parent_id].append(node['id'])
                
            # Preorder DFS
            if 'children' in node and node['children']:
                self.retrieve_parent_child_relationships(node['children'], relationships)  

        return relationships

if __name__ == "__main__":
    # Example usage
    hierarchical_data = [
        {'id': 1, 'name': 'Root', 'children': [
            {'id': 2, 'name': 'Child 1'},
            {'id': 3, 'name': 'Child 2', 'children': [
                {'id': 4, 'name': 'Grandchild 1'},
                {'id': 5, 'name': 'Grandchild 2'}
            ]}
        ]}
    ]

    converter = NestedSetModelConverter()

    # Convert hierarchical data to nested set model
    converter.convert_to_nested_set(hierarchical_data)

    # Retrieve parent-child relationships from the nested set model
    relationships = converter.retrieve_parent_child_relationships(hierarchical_data)

    # Returns nested list representation
    print("Nested Set Model:")
    print(hierarchical_data)

    # Returns adjacency list
    print("\nParent-Child Relationships:")
    print(relationships)