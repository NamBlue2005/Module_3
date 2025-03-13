package service;


import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    private static List<Product> products = new ArrayList<>();

    static {
        products.add(new Product(1, "MacBook Pro M2", 2000, "Laptop cao cấp cho dân lập trình", "Apple"));
        products.add(new Product(2, "Samsung Galaxy S23", 900, "Điện thoại flagship Android", "Samsung"));
        products.add(new Product(3, "iPad Air 5", 600, "Máy tính bảng hiệu năng cao", "Apple"));
        products.add(new Product(4, "Sony WH-1000XM5", 400, "Tai nghe chống ồn tốt nhất", "Sony"));
        products.add(new Product(5, "Dell XPS 15", 1800, "Laptop mạnh cho công việc sáng tạo", "Dell"));
    }

    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public void add(Product product) {
        products.add(product);
    }

    @Override
    public void update(int id, Product product) {
        for (Product p : products) {
            if (p.getId() == id) {
                p.setName(product.getName());
                p.setPrice(product.getPrice());
                p.setDescription(product.getDescription());
                p.setProducer(product.getProducer());
                return;
            }
        }
    }

    @Override
    public void delete(int id) {
        products.removeIf(product -> product.getId() == id);
    }

    @Override
    public Product findById(int id) {
        return products.stream().filter(product -> product.getId() == id).findFirst().orElse(null);
    }

    @Override
    public void save(Product product) {
        products.add(product);
    }

    @Override
    public int generateId() {
        int maxId = 0;
        for (Product p : products) {
            if (p.getId() > maxId) {
                maxId = p.getId();
            }
        }
        return maxId + 1;
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> result = new ArrayList<>();
        for (Product p : products) {
            if (p.getName().toLowerCase().contains(name.toLowerCase())) {
                result.add(p);
            }
        }
        return result;
    }
}